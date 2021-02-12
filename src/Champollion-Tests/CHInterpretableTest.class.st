Class {
	#name : #CHInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'receiver',
		'collaborator'
	],
	#category : #'Champollion-Tests'
}

{ #category : #tests }
CHInterpreterTest >> executeSelector: aSymbol [ 
	^ self executeSelector: aSymbol withReceiver: receiver 
]

{ #category : #tests }
CHInterpreterTest >> executeSelector: aSymbol withReceiver: aReceiver [ 
	| ast |
	ast := (CHInterpretable >> aSymbol ) parseTree .
	^ self interpreter execute: ast withReceiver: aReceiver
]

{ #category : #tests }
CHInterpreterTest >> interpreter [
	^ CHInterpreter new
]

{ #category : #tests }
CHInterpreterTest >> setUp [ 
	super setUp.
	receiver := CHInterpretable new.
	interpreter := CHInterpreter new.
	receiver collaborator: CHInterpretable new.
]

{ #category : #tests }
CHInterpreterTest >> testArgumentAccess [
	receiver x: 200.
	collaborator x: 300.
	self executeSelector: #changeCollaboratorWithArgument .
	self assert: receiver x equals: 200.
	self assert: collaborator x equals: 500
]

{ #category : #tests }
CHInterpreterTest >> testAssignmentReturnsAssignedValue [
	self assert: (self executeSelector: #store100IntoX) equals: 100
]

{ #category : #tests }
CHInterpreterTest >> testBalancingStack [
	self assert: (self executeSelector: #setXAndMessage ) equals: 1000
]

{ #category : #tests }
CHInterpreterTest >> testInstanceVariableStoreInMethodActivationDoesNotChangeSender [
	receiver x: 200.
	collaborator x: 300.
	"changeCollaboratorX will replace collaborator's x but not the receiver's"
	self executeSelector: #changeCollaboratorX .
	self assert: receiver x equals: 200.
	self assert: collaborator x equals: 100
]

{ #category : #tests }
CHInterpreterTest >> testReturnBoolean [
	"Do not use deny: to make explicit that we expect the value false"
	self
		assert: (self executeSelector: #returnBoolean  )
		equals: false
]

{ #category : #tests }
CHInterpreterTest >> testReturnEmptyLiteralArray [
	self
		assert: (self executeSelector: #returnEmptyLiteralArray )
		equals: #()
]

{ #category : #tests }
CHInterpreterTest >> testReturnFloat [
	self
		assert: (self executeSelector: #returnFloat  )
		equals: 3.14
]

{ #category : #tests }
CHInterpreterTest >> testReturnGlobal [
	| globalObject |
	globalObject := Object new.
	interpreter globalEnvironmentAt: #Global put: globalObject .
	self assert: (self executeSelector: #returnGlobal) equals: globalObject 
]

{ #category : #tests }
CHInterpreterTest >> testReturnInstanceVariableRead [
	receiver x: 100.
	self assert: (self executeSelector: #returnX withReceiver: receiver ) equals: 100
]

{ #category : #tests }
CHInterpreterTest >> testReturnInteger [
	self
		assert: (self executeSelector: #returnInteger )
		equals: 5
]

{ #category : #tests }
CHInterpreterTest >> testReturnRecursiveLiteralArray [
	self
		assert: (self executeSelector: #returnRecursiveLiteralArray  )
		equals: #(true 1 #('ahah'))
]

{ #category : #tests }
CHInterpreterTest >> testReturnSelf [
	"Convey our intention of checking identity by using an explicit identity check"
	self assert: (self executeSelector: #returnSelf withReceiver: receiver ) == receiver 
]

{ #category : #tests }
CHInterpreterTest >> testReturnSuper [
	"Convey our intention of checking identity by using an explicit identity check"
	self assert: (self executeSelector: #returnSuper withReceiver: receiver ) == receiver
]

{ #category : #tests }
CHInterpreterTest >> testSelfSend [
	receiver x: 100.
	self assert: (self executeSelector: #sendMessageReturnX ) equals:100
]

{ #category : #tests }
CHInterpreterTest >> testStore100IntoX [
	receiver x: 17.
	self executeSelector: #store100IntoX .
	self assert: receiver x equals: 100
]

{ #category : #tests }
CHInterpreterTest >> testUnassignedTempHasNilValue [
	self assert: (self executeSelector: #returnUnassignedTemp ) equals: nil
]

{ #category : #tests }
CHInterpreterTest >> testWriteTemporaryVariable [
	self assert: (self executeSelector: #writeTemporaryVariable ) equals: 100
]

