Class {
	#name : #CountingManualInterpreterSelf,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #ASTInterpreters
}

{ #category : #initialization }
CountingManualInterpreterSelf >> initialize [

	super initialize.
	count := 0
]

{ #category : #initialization }
CountingManualInterpreterSelf >> numberOfSelf [

	^ count
]

{ #category : #initialization }
CountingManualInterpreterSelf >> visitAssignmentNode: aRBAssignmentNode [

	aRBAssignmentNode value acceptVisitor: self
]

{ #category : #initialization }
CountingManualInterpreterSelf >> visitMessageNode: aRBMessageNode [

	aRBMessageNode receiver acceptVisitor: self.
	aRBMessageNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #initialization }
CountingManualInterpreterSelf >> visitMethodNode: aRBMethodNode [

	aRBMethodNode statements do: [ :each | each acceptVisitor: self ]
]

{ #category : #initialization }
CountingManualInterpreterSelf >> visitReturnNode: aRBReturnNode [

	^ self
]

{ #category : #initialization }
CountingManualInterpreterSelf >> visitSelfNode: aRBSelfNode [
	count := count + 1.
	^ self
]

{ #category : #'as yet unclassified' }
CountingManualInterpreterSelf >> visitVariableNode: aRBVariableNode [ 
	self shouldBeImplemented.
]
