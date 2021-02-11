Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #accessing }
ENegation class >> expression: anExpression [
^self new expression: anExpression 
]

{ #category : #'public access' }
ENegation >> evaluateWith: anObject [
	^(expression evaluateWith: anObject ) negated 
]

{ #category : #accessing }
ENegation >> expression: anExpression [
expression := anExpression 
]

{ #category : #arithmetic }
ENegation >> negated [ 
^ expression
]

{ #category : #printing }
ENegation >> printOn:  aStream [
aStream nextPutAll:'- ';
nextPutAll: expression printString
]
