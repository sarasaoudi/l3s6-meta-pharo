Class {
	#name : #CountingManualInterpreterInstanceVariable,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #ASTInterpreters
}

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> initialize [

super initialize. 
count := 0
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> numberOfInstanceVariable [

^ count
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> visitAssignmentNode: aRBAssignmentNode [

aRBAssignmentNode value acceptVisitor: self
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> visitMessageNode: aRBMessageNode [

aRBMessageNode receiver acceptVisitor: self.
aRBMessageNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> visitMethodNode: aRBMethodNode [

aRBMethodNode statements do: [ :each | each acceptVisitor: self ]
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> visitReturnNode: aRBReturnNode [

^ self
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> visitSelfNode: aRBSelfNode [

^ self
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> visitVariableNode: aRBVariableNode [

	count := count + 1.
	^ self
]
