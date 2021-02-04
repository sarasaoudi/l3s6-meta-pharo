"
"" Dice is a simple concrete class .
    Its API is
    - faces
    - roll
    - initialize 
    Its creation API is message withValue: 
""
"
Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'instance creation' }
Die class >> withFaces: aNumber [
	"Create and initialize a new die with aNumber faces"
	| instance |
	instance := self new.
	instance faces: aNumber.
	^ instance
	
]

{ #category : #accesing }
Die >> faces [
	^ faces
]

{ #category : #accessing }
Die >> faces: anInteger [ 
	faces := anInteger
]

{ #category : #initialization }
Die >> initialize [

		super initialize.
		faces := 6
]

{ #category : #accesing }
Die >> roll [

	^ faces atRandom 
]
