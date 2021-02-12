Class {
	#name : #CHMethodeScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'variables'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHMethodeScope >> read: aString [ 
	^ variables at: aString 
]

{ #category : #accessing }
CHMethodeScope >> receiver [ 
	^ receiver 
]

{ #category : #accessing }
CHMethodeScope >> receiver: aCHInterpretable [
	receiver := aCHInterpretable 
]

{ #category : #accessing }
CHMethodeScope >> scopeDefining: aString [ 
	(variables includesKey: aString )
	ifTrue: [ ^ self ].
	^ self parentScope scopeDefining: aString 

]

{ #category : #accessing }
CHMethodeScope >> write: aString withValue: aValue [
	variables at: aString put: aValue
]
