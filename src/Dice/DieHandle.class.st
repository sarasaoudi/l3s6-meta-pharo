Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #arithmetic }
DieHandle >> + aDieHandle [

	| handle |
	handle := DieHandle new.
	self dice do: [:each | handle addDie: each].
	aDieHandle dice do: [ :each |handle  addDie: each ].
	^handle
	
]

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

{ #category : #'as yet unclassified' }
DieHandle >> sumWithDie: aDie [
|handle|
handle:= self class new.
self dice do: [ :each | handle addDie: each ].
handle addDie: aDie.
^handle
]

{ #category : #'as yet unclassified' }
DieHandle >> sumWithHandle: aDieHandle [
|handle|
handle:=self class new.
self dice do: [ :each | handle addDie: each ].
aDieHandle dice do: [ :each | handle addDie: each ].
^handle
]
