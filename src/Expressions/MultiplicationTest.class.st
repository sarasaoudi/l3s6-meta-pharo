Class {
	#name : #MultiplicationTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
MultiplicationTest >> testEvaluate [
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self
		assert:
			((EMultiplication new
				right: ep1;
				left: ep2) evaluateWith: Dictionary new)
		equals: 15
]

{ #category : #tests }
MultiplicationTest >> testEvaluateNegated [
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self
		assert:
			((EMultiplication new
				right: ep1;
				left: ep2) negated evaluateWith: Dictionary new)
		equals: -15
]

{ #category : #tests }
MultiplicationTest >> testEvaluateWithClassCreation [
	| ep1 ep2 |
	ep1 := EConstant value: 5.
	ep2 := EConstant value: 3.
	self
		assert: ((EMultiplication left: ep1 right: ep2) evaluateWith: Dictionary new)
		equals: 15
]

{ #category : #tests }
MultiplicationTest >> testPrinting [ 
self assert: (EMultiplication  fiveTimesThree ) printString equals: '( 5 * 3 )'.
self assert: (EMultiplication  fiveTimesThree )negated printString equals: '- ( 5 * 3 )'
]
