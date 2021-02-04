Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #accesing }
DieHandle >> addDie: aDie [

dice add: aDie
]

{ #category : #accesing }
DieHandle >> dice [

^dice
]

{ #category : #accesing }
DieHandle >> diceNumber [
^ dice size
]

{ #category : #initialization }
DieHandle >> initialize [ 
 
	super initialize.
	dice := OrderedCollection new.
]
