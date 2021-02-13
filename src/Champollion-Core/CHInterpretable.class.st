Class {
	#name : #CHInterpretable,
	#superclass : #CHInterpretableSuperclass,
	#instVars : [
		'x',
		'collaborator',
		'evaluationOrder',
		'current'
	],
	#category : #'Champollion-Core'
}

{ #category : #'as yet unclassified' }
CHInterpretable >> callingFailingPrimitive [
	^ self failingPrimitive 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorWithArgument [
	collaborator x: 500
]

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorX [
	collaborator store100IntoX 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> collaborator [
	^ collaborator 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> collaborator: anObject [ 
	collaborator := anObject 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> currentMethod [ 
	^ self tempAt: #___method
]

{ #category : #'as yet unclassified' }
CHInterpretable >> doesNotUnderstand: aMessage [
	^ aMessage 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> doesSuperLookupFromSuperclass [
	^ super isInSuperclass 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> evaluateReceiver [
	evaluationOrder := self next.
	^ self
]

{ #category : #'as yet unclassified' }
CHInterpretable >> evaluationOrder [
	^ evaluationOrder 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> failingPrimitive [
	<primitive: 1>
	^ 'failure'
]

{ #category : #'as yet unclassified' }
CHInterpretable >> initialize [ 
	super initialize .
	current := { "empty " }.
]

{ #category : #'as yet unclassified' }
CHInterpretable >> isInSuperclass [
	^ false
]

{ #category : #'as yet unclassified' }
CHInterpretable >> messageArg1: arg1 arg2: arg2 arg3: arg3 [
	^ { arg1 . arg2 . arg3  }
]

{ #category : #'as yet unclassified' }
CHInterpretable >> next [ 
	"Implement a stram as an increment in terms of Peano axiom"
	| result |
	result := current.
	"We increment the counter"
	current := { current }.
	"we return the previous result"
	^ result 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> overriddenMethod [ 
	^ super overriddenMethod 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnBoolean [
	^ false
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEmptyLiteralArray [ 
	^ #()
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEvaluationOrder [
	^ self evaluateReceiver 
	messageArg1: self next 
	arg2: self next 
	arg3: self next 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnFloat [
	^ 3.14
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnGlobal [
	^ Global
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnInteger [ 
	^ 5
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnRecursiveLiteralArray [ 
	^ #(true 1 #('ahah'))
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSelf [
	^ self
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSuper [
	^ super
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnUnassignedTemp [
	| temp |
	^ temp
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnX [
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> sendMessageInSuperclass [
	^ self methodInSuperclass 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> sendMessageNotUnderstood [
	^ self messageIDoNotUnderstandWithArg1: 17 withArg2: 27
]

{ #category : #'as yet unclassified' }
CHInterpretable >> sendMessageReturnX [
	^ self returnX
]

{ #category : #'as yet unclassified' }
CHInterpretable >> setXAndMessage [
	x := 1000.
	collaborator returnX.
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> store100IntoX [
	^ x := 100
]

{ #category : #'as yet unclassified' }
CHInterpretable >> writeTemporaryVariable [
	| temp |
	temp := 100.
	^ temp
]

{ #category : #'as yet unclassified' }
CHInterpretable >> x [
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> x: anInteger [
	x := anInteger 
]
