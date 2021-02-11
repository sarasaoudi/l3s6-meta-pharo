Class {
	#name : #EExpression,
	#superclass : #Object,
	#category : #Expressions
}

{ #category : #arithmetic }
EExpression >> negated [
^ ENegation new expression: self 
]
