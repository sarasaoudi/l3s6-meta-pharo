Class {
	#name : #CountingInterpreter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'count'
	],
	#category : #ASTInterpreters
}

{ #category : #initialization }
CountingInterpreter >> initialize [

	super initialize.
	count := 0
]

{ #category : #initialization }
CountingInterpreter >> numberOfMessages [

	^ count
]

{ #category : #initialization }
CountingInterpreter >> visitMessageNode: aMessageNode [

	super visitMessageNode: aMessageNode.
	count := count + 1.
]
