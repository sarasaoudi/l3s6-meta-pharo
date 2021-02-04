Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTest >> testInitializeIsOk [
	self assert: Die new faces equals: 6
]

{ #category : #tests }
DieTest >> testRolling [ 
	| d |
	d := Die new.
	10 timesRepeat: [ self assert: (d roll between: 1 and: 6 ) ]
]
