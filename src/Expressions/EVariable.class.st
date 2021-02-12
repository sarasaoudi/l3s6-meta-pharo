Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EVariable >> evaluateWith: aBinndingDictionary [
^ aBinndingDictionary at: id 
]

{ #category : #accessing }
EVariable >> id: aSymbol [
id := aSymbol
]

{ #category : #printing }
EVariable >> printOn: aStream [
aStream nextPutAll: id asString 
]
