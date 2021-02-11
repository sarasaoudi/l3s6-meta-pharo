Class {
	#name : #EAddition,
	#superclass : #EBinaryExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EAddition class >> fiveplusThree [
<sampleInstance>

|ep1 ep2 |
ep1 := EConstant new value: 5.
ep2 := (EConstant new  value: 3 ).
^self new left: ep1; right:ep2
]

{ #category : #'instance creation' }
EAddition class >> left: anInteger right: anInteger2 [
^ self new left: anInteger ; right: anInteger2 
]

{ #category : #accessing }
EAddition >> evaluateWith: anObject [
	^ (left evaluateWith: anObject )
		+ (right evaluateWith: anObject )
]

{ #category : #'as yet unclassified' }
EAddition >> operatorString [
^ ' + '
]

{ #category : #printing }
EAddition >> printOn:  aStream [
aStream nextPutAll:'( ';
nextPutAll: left printString.
aStream nextPutAll:' + ';
nextPutAll: right printString.
aStream nextPutAll:' )'.
]
