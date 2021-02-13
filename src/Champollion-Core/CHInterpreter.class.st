Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'globalScope',
		'primitives'
	],
	#category : #'Champollion-Core'
}

{ #category : #running }
CHInterpreter >> argumentAt: anInteger [ 
^ self tempAt: (self currentMethod arguments at: anInteger ) name
]

{ #category : #running }
CHInterpreter >> currentScope [ 
^ self topFrame
]

{ #category : #running }
CHInterpreter >> execute: anAST [
^ self visitNode: anAST 
]

{ #category : #running }
CHInterpreter >> execute: anAST withReceiver: anObject [ 
| result |
self pushNewFrame.
"Set up the scope chain"
self topFrame parentScope: (CHInstanceScope new 
	receiver: anObject;
	parentScope: globalScope;
	yourself);
yourself.
self topFrame receiver: anObject.
result := self visitNode: anAST.
self popFrame.
^ result
]

{ #category : #running }
CHInterpreter >> execute: anAST withReceiver: anObject andArguments: aCollection [
	| result |
	self pushNewFrame.
	"Set up the scope chain"
	self topFrame parentScope: (CHInstanceScope new 
		receiver: anObject;
		parentScope: globalScope;
		yourself);
	yourself.
	self topFrame receiver: anObject.
	anAST arguments 
		with: aCollection
		do: [ :arg :value | self tempAt: arg name put: value ].
	result := self visitNode: anAST.
	self popFrame.
	^ result
]

{ #category : #running }
CHInterpreter >> executeMethod: anAST withReceiver: anObject andArguments: aCollection [
	| result |
	self pushNewFrame.
	self tempAt: #___method put: anAST.
	self tempAt: #self put: anObject.  
	anAST arguments with: aCollection do: [ :arg :value | self tempAt: arg name put: value ].
	result := self visitNode: anAST body .
	self popFrame.
	^ result
]

{ #category : #running }
CHInterpreter >> executeMethode: anAST withReceiver: anObject [ 
	^ self
	executeMethod: anAST 
	withReceiver: anObject 
	andArguments: #() 
]

{ #category : #running }
CHInterpreter >> executePrimitiveMethod: anAST [ 
	| primitiveNumber |
	primitiveNumber := anAST pragmas 
		detect: [ :each |each isPrimitive ]
		ifFound: [ :aPragmaPrimitive | aPragmaPrimitive arguments first value ]
		ifNone: [ self error: 'Not a primitive method' ].
	^ self perform: (primitives at: primitiveNumber )
]

{ #category : #running }
CHInterpreter >> globalEnvironmentAt: aSymbol put: anObject [ 
	globalScope at: aSymbol put: anObject 
]

{ #category : #running }
CHInterpreter >> initialize [
	super initialize .
	globalScope := CHGlobalScope new.
	stack := CTStack new.
	primitives := Dictionary new.
	self initializePrimitiveTable.
]

{ #category : #running }
CHInterpreter >> initializePrimitiveTable [
	primitives at: 1 put: #primitiveSmallIntegerAdd
]

{ #category : #running }
CHInterpreter >> lookup: aSymbol fromClass: aClass [ 
	"return the AST of a method or nil if none is found"
	"If the class defines a method for the selector, return the AST corresponding to the method"
	(aClass includesSelector: aSymbol )
		ifTrue: [ ^ (aClass compiledMethodAt: aSymbol ) ast ].
	"Otherwise lookup recursively in the superclass. If we reach the end of the hierarchy return nil"
	^ aClass superclass 
		ifNil: [ nil ]
		ifNotNil: [ self lookup: aSymbol fromClass: aClass superclass ]
]

{ #category : #running }
CHInterpreter >> popFrame [
	stack pop
]

{ #category : #running }
CHInterpreter >> primitiveSmallIntegerAdd [
	| receiver argument |
	receiver := self receiver.
	receiver class = SmallInteger 
		ifFalse: [ CHPrimitiveFail signal ].
	argument  := self argumentAt: 1.
	^ receiver + argument
]

{ #category : #running }
CHInterpreter >> pushNewFrame [
	| newTop |
	newTop := CHMethodeScope new.
	stack push: newTop .
	^ newTop 
]

{ #category : #running }
CHInterpreter >> receiver [ 
	^ self topFrame receiver 
]

{ #category : #running }
CHInterpreter >> scopeDefining: aName [
	^ self currentScope scopeDefining: aName
]

{ #category : #running }
CHInterpreter >> send: aSelector receiver: newReceiver lookupFromClass: lookupClass arguments: arguments [
		"Lookup a selector from a class, and activate the method.
		Handle does not understand case and message reification on demande if lookup fails."
		| method |
		method := self lookup: aSelector fromClass: lookupClass .
		method ifNil: [ | messageReification | 
			messageReification := Message 
				selector: aSelector 
				arguments: arguments .
			^ self send: #doesNotUnderstand:
					 receiver: newReceiver
					 lookupFromClass: lookupClass 
					 arguments: { messageReification } ].
		^ self execute: method withReceiver: newReceiver  andArguments: arguments   
]

{ #category : #running }
CHInterpreter >> smallintAdd [
	^ 1 + 5
]

{ #category : #running }
CHInterpreter >> tempAt: aSymbol put: anInteger [
	self topFrame at: aSymbol put: anInteger 
]

{ #category : #running }
CHInterpreter >> topFrame [
	^ stack top
]

{ #category : #visiting }
CHInterpreter >> visitArrayNode: aRBArrayNode [
	^ aRBArrayNode statements 
	collect: [ :e | self visitNode: e ] as: Array
]

{ #category : #running }
CHInterpreter >> visitAssignmentNode: anAssignmentNode [
	| value |
	value := self visitNode: anAssignmentNode value.
	(self scopeDefining: anAssignmentNode variable name)
		write: anAssignmentNode variable name
		withValue: value.
	^ value
]

{ #category : #running }
CHInterpreter >> visitGlobalNode: aRBGlobalNode [
	^  globalScope
		at: aRBGlobalNode name 
		ifAbsent: [ self error: aRBGlobalNode name, ' not found' ]  
]

{ #category : #visiting }
CHInterpreter >> visitInstanceVariableNode: aRBInstanceVariableNode [ 
	^ self visitVariableNode: aRBInstanceVariableNode 
]

{ #category : #visiting }
CHInterpreter >> visitLiteralArrayNode: aLiteralArrayNode [ 
	^ aLiteralArrayNode contents
		collect: [ :literalNode | self visitNode: literalNode ]
		as: Array 
]

{ #category : #running }
CHInterpreter >> visitLiteralValueNode: aLiteralValueNode [
	^ aLiteralValueNode value
]

{ #category : #running }
CHInterpreter >> visitMessageNode: aMessageNode [ 
	| newReceiver args lookupClass |
	newReceiver := self visitNode: aMessageNode receiver.
	args := aMessageNode arguments collect: [ :each | self visitNode: each ].
	lookupClass := aMessageNode receiver isSuperVariable
		ifTrue: [ self currentMethod methodClass superclass ]
		ifFalse: [ newReceiver class ].
	^ self
		send: aMessageNode 
		receiver: newReceiver 
		lookupFromClass: lookupClass 
		arguments: args asArray  
]

{ #category : #running }
CHInterpreter >> visitMethodNode: aMethodeNode [
	[ aMethodeNode isPrimitive ifTrue: [ ^ self executePrimitiveMethod: aMethodeNode  ]]
		on: CHPrimitiveFail do: [ :err | "Nothing, just continue with the method body"].
	^ self visitNode: aMethodeNode body
]

{ #category : #running }
CHInterpreter >> visitNode: aNode [
	^ aNode acceptVisitor: self
]

{ #category : #running }
CHInterpreter >> visitReturnNode: aReturnNode [
	^ self visitNode: aReturnNode value
]

{ #category : #running }
CHInterpreter >> visitSelfNode: aNode [
	^ self receiver
]

{ #category : #running }
CHInterpreter >> visitSequenceNode: aSequenceNode [
	"Visit all but the last statement wihtout caring about the result"
	aSequenceNode statements allButLast 
	do: [ :each | self visitNode: each ].
	^ self visitNode: aSequenceNode statements last
]

{ #category : #running }
CHInterpreter >> visitSuperNode: aNode [
	^ self receiver
]

{ #category : #running }
CHInterpreter >> visitVariableNode: aVariableNode [
	^ (self scopeDefining: aVariableNode name) read: aVariableNode name
]
