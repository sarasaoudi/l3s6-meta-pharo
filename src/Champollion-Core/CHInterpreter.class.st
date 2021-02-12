Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'globalScope'
	],
	#category : #'Champollion-Core'
}

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
	self topFrame parentScope: (CHInstanceScope new 
		receiver: anObject;
		parentScope: globalScope;
		yourself);
	yourself.
	self topFrame receiver: anObject.
	anAST arguments with: aCollection do: [ :arg :value | self topFrame at: arg name put: value ].
	anAST temporaryNames do: [ :tempName | self tempAt: tempName  put: nil ].
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
CHInterpreter >> globalEnvironmentAt: aSymbol put: anObject [ 
	globalScope at: aSymbol put: anObject 
]

{ #category : #running }
CHInterpreter >> initialize [
	super initialize .
	globalScope := CHGlobalScope new.
	stack := CTStack new.
]

{ #category : #running }
CHInterpreter >> popFrame [
	stack pop
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
CHInterpreter >> tempAt: aSymbol put: anInteger [
	self topFrame at: aSymbol put: anInteger 
]

{ #category : #running }
CHInterpreter >> topFrame [
	^ stack top
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
	| newReceiver method args |
	newReceiver := self visitNode: aMessageNode receiver.
	args := aMessageNode arguments collect: [ :each | self visitNode: each ].
	method := (newReceiver class compiledMethodAt: aMessageNode selector) ast.
	^ self executeMethod: method withReceiver: newReceiver andArguments: args 
]

{ #category : #running }
CHInterpreter >> visitMethodNode: aMethodeNode [
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
