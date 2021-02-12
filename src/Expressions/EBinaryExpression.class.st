Class {
	#name : #EBinaryExpression,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #accessing }
EBinaryExpression >> left:  anInteger [
left := anInteger
]

{ #category : #'as yet unclassified' }
EBinaryExpression >> operatorString [
^ self subclassResponsibility 
]

{ #category : #printing }
EBinaryExpression >> printOn: aStream [
aStream nextPutAll: '( '.
left printOn: aStream.
aStream nextPutAll: self operatorString.
right printOn: aStream.
aStream nextPutAll: ' )'.
]

{ #category : #accessing }
EBinaryExpression >> right: anInteger [
right := anInteger
]
