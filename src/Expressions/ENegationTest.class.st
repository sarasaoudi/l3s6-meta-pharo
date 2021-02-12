Class {
	#name : #ENegationTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
ENegationTest >> testClassCreation [
	self
		assert:
			((ENegation expression: (EConstant value: 5))
				evaluateWith: Dictionary new)
		equals: -5
]

{ #category : #tests }
ENegationTest >> testEvaluate [
	self
		assert:
			((ENegation new expression: (EConstant new value: 5))
				evaluateWith: Dictionary new)
		equals: -5
]

{ #category : #tests }
ENegationTest >> testNeatedStructureIsCorect [
|exp|
exp := EConstant value: 11.
self assert: exp negated class= ENegation.
self assert: exp negated negated equals: exp.
]

{ #category : #tests }
ENegationTest >> testNegattionNegated [
	self
		assert: ((EConstant new value: 5) negated negated evaluateWith: Dictionary new)
		equals: 5
]
