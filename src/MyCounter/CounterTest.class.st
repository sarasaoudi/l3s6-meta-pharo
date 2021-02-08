Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #MyCounter
}

{ #category : #tests }
CounterTest >> testAlternateCreationmethod [
	self assert: ((Counter withValue: 19) increment ; count)=20
]

{ #category : #running }
CounterTest >> testCountIsSetAndRead [
   | c |
   c := Counter new.
   c count: 5.
   self assert: c count equals: 5
]

{ #category : #tests }
CounterTest >> testDecrement [
   | c |
   c := Counter new.
   c count: 1.
   c decrement.
   self assert: c count equals: 0
]

{ #category : #tests }
CounterTest >> testIncrement [
   | c |
   c := Counter new.
   c count: 0.
   c increment;increment .
   self assert: c count equals: 2
]

{ #category : #tests }
CounterTest >> testInitialize [ 

|c|
c := Counter new.
self assert: c count equals: 0
]
