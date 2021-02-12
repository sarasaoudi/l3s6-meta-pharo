Class {
	#name : #CHInstanceScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'parentScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHInstanceScope >> definedVariables [
	^ receiver class allInstVarNames 
]

{ #category : #accessing }
CHInstanceScope >> parentScope [
	^ parentScope 
]

{ #category : #accessing }
CHInstanceScope >> parentScope: anObject [ 
	parentScope := anObject 
]

{ #category : #accessing }
CHInstanceScope >> read: aString [ 
	^ receiver instVarNamed: aString 
]

{ #category : #accessing }
CHInstanceScope >> receiver: anObject [ 
	receiver := anObject 
]

{ #category : #accessing }
CHInstanceScope >> scopeDefining: aString [ 
	(self definedVariables includes: aString )
	ifTrue: [ ^ self ].
	^ self parentScope scopeDefining: aString 
]

{ #category : #accessing }
CHInstanceScope >> write: aString withValue: anInteger [
	receiver instVarNamed: aString  put: anInteger  
]

