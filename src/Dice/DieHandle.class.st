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

{ #category : #accesing }
DieHandle >> maxValue [
   | sum |
   sum:=0.
	dice do: [ :each | sum:= sum +each faces ].
	^sum
]

{ #category : #accesing }
DieHandle >> roll [ 
   | sum |
   sum:=0.
	dice do: [ :each | sum:= sum +each roll ].
	^sum
]
