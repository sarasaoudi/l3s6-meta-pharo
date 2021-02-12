Class {
	#name : #EvariableTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
EvariableTest >> testEvaluateXplusY [

|ep1 ep2 add|
ep1:= EVariable new id: #x.
ep2:= EVariable new id: #y.
add := EAddition left: ep1 right: ep2.

self assert: (add evaluateWith: {#x -> 10 . #y -> 2} asDictionary ) equals: 12.
self assert: (add evaluateWith: {#x -> 10 . #y -> 12} asDictionary ) equals: 22.
]

{ #category : #'as yet unclassified' }
EvariableTest >> testvalueOfx [
self assert: ((EVariable new id: #x) evaluateWith: { #x -> 10 } asDictionary  )equals: 10.
]

{ #category : #'as yet unclassified' }
EvariableTest >> testvalueOfxInNegation [
self assert: ((EVariable new id: #x ) negated evaluateWith: {#x -> 10} asDictionary )equals: -10
]
