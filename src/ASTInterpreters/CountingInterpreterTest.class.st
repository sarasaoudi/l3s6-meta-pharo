Class {
	#name : #CountingInterpreterTest,
	#superclass : #TestCase,
	#category : #ASTInterpreters
}

{ #category : #tests }
CountingInterpreterTest >> testMessageCount [
	
	| ast counting |
	ast := RBParser parseMethod: (Point >> #sideOf: ) sourceCode.
	counting := CountingInterpreter new.
	ast acceptVisitor: counting.
	self assert: counting numberOfMessages equals: 4.
]
