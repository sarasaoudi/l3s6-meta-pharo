Class {
	#name : #DieHandleTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieHandleTest >> testAddingAnHandleWithADie [
|handle res|
handle := DieHandle new
addDie: (Die withFaces: 6);
addDie: (Die withFaces: 10);
yourself.
res:= handle + (Die withFaces: 20).
self assert: res diceNumber equals: 3
]

{ #category : #tests }
DieHandleTest >> testAddingTwiceTheSameDice [
	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber = 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber = 2.
]

{ #category : #tests }
DieHandleTest >> testCreationAdding [
	| handle |
	handle := DieHandle new 
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	self assert: handle diceNumber = 2.
]

{ #category : #tests }
DieHandleTest >> testMaxValue [

	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	handle addDie: (Die withFaces: 10).
	self assert: handle maxValue equals: 16.
]

{ #category : #tests }
DieHandleTest >> testRoll [

	| handle |
	handle := DieHandle new
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
	yourself.
	10 timesRepeat: 
		[self assert: (handle roll between: handle diceNumber and: handle maxValue ) ]
]

{ #category : #tests }
DieHandleTest >> testSimpleCreation [

	self assert: 2 D20 diceNumber equals: 2
]

{ #category : #tests }
DieHandleTest >> testSumming [

	| handle |
	handle := 2 D20 + 3 D10.
	self assert: handle diceNumber = 5.
]
