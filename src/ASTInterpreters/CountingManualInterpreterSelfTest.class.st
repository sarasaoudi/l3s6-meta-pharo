Class {
	#name : #CountingManualInterpreterSelfTest,
	#superclass : #TestCase,
	#category : #ASTInterpreters
}

{ #category : #tests }
CountingManualInterpreterSelfTest >> testSelfCount [ 

	| ast counting |   
	ast := RBParser parseMethod: (Point >> #sideOf:) sourceCode.  
	counting := CountingManualInterpreterSelf new.  
	ast acceptVisitor: counting.  
	self assert: counting numberOfSelf equals: 1
]

{ #category : #tests }
CountingManualInterpreterSelfTest >> testSelfCount2 [

	| ast counting |   
	ast := RBParser parseMethod: (Point >> #isZero) sourceCode.  
	counting := CountingManualInterpreterSelf new.  
	ast acceptVisitor: counting.  
	self assert: counting numberOfSelf equals: 0
]
