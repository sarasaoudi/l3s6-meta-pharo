"
"" Counter is a simple concrete class <hich supports incrementing and decrementing a counter.
    Its API is
    - decrement, increment 
    - count 
    Its creation API is message withValue: 
""
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #initialization }
Counter class >> withValue: anInteger [

	|c|
	c := self new count: anInteger.
	^ c
]

{ #category : #accessing }
Counter >> count [ 
"return the current value of the value instance variable"
 ^ count 
]

{ #category : #accessing }
Counter >> count: anInteger [
 count :=anInteger
]

{ #category : #API }
Counter >> decrement [  
self count: self count - 1 
]

{ #category : #accessing }
Counter >> increment [  
self count: self count + 1 
]

{ #category : #initialization }
Counter >> initialize [ 
"set the initial value of the value to 0"

	super initialize.
	count := 0
]

{ #category : #printing }
Counter >> printOn: aStream [

	super printOn: aStream.
   aStream nextPutAll: ' with value: ' , self count printString.
   aStream cr
]
