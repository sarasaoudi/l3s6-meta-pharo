Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EMultiplication class >> fiveTimesThree [
<sampleInstance>

|ep1 ep2 |
ep1 := EConstant constant5.
ep2 := (EConstant constant3  ).
^self new left: ep1; right:ep2
]

{ #category : #'instance creation' }
EMultiplication class >> left: anInteger right: anInteger2 [
^ self new left: anInteger ; right: anInteger2 
]

{ #category : #accessing }
EMultiplication >> evaluateWith: anObject [
	^ (left evaluateWith: anObject )
		* (right evaluateWith: anObject )
]

{ #category : #'as yet unclassified' }
EMultiplication >> operatorString [
^ ' * '
]

{ #category : #printing }
EMultiplication >> printOn:  aStream [
aStream nextPutAll:'( ';
nextPutAll: left printString.
aStream nextPutAll:' * ';
nextPutAll: right printString.
aStream nextPutAll:' )'.
]
