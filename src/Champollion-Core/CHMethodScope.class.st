Class {
	#name : #CHMethodeScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'variables',
		'parentScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHMethodeScope >> includesKey: aString [ 
	^ variables includesKey: aString 
]

{ #category : #accessing }
CHMethodeScope >> initialize [ 	
	super initialize .
	variables := Dictionary new.
]

{ #category : #accessing }
CHMethodeScope >> parentScope [
	^ parentScope 
]

{ #category : #accessing }
CHMethodeScope >> parentScope: aScope [
	parentScope := aScope 
]

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
