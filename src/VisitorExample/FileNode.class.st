Class {
	#name : #FileNode,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#category : #VisitorExample
}

{ #category : #visiting }
FileNode >> acceptVisitor: aVisitor [

	^aVisitor visitFileNode: self
]

{ #category : #accessing }
FileNode >> size [ 	

	^ size
]

