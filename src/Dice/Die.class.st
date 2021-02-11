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

{ #category : #arithmetic }
Die >> + aDicable [
^aDicable sumWithDie: self
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

{ #category : #printing }
Die >> printOn: aStream [
"a Die (faces number)"
	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream print: faces.
	aStream nextPutAll: ')'
]

{ #category : #accesing }
Die >> roll [

	^ faces atRandom 
]

{ #category : #'as yet unclassified' }
Die >> sumWithDie: aDie [
^ DieHandle new 
addDie: self;
addDie: aDie; yourself
]

{ #category : #'as yet unclassified' }
Die >> sumWithHandle: aDieHandle [

|handle|
handle := DieHandle new.
aDieHandle dice do: [ :each |handle addDie: each ].
handle addDie: self.
^handle
]
