Class {
	#name : #CountingManualInstanceVariableTest,
	#superclass : #TestCase,
	#category : #ASTInterpreters
}

{ #category : #tests }
CountingManualInstanceVariableTest >> testInstanceVariableCount [

	| ast counting |   
	ast := RBParser parseMethod: (Point >> #sideOf:) sourceCode.  
	counting := CountingManualInterpreterInstanceVariable new.  
	ast acceptVisitor: counting.  
	self assert: counting numberOfInstanceVariable equals: 1
]
