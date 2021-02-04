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

{ #category : #accesing }
Die >> faces [
	^ faces
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
