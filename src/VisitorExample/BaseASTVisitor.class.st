Class {
	#name : #BaseASTVisitor,
	#superclass : #Object,
	#category : #VisitorExample
}

{ #category : #visiting }
BaseASTVisitor >> visitLiteralValueNode: aRBLiteralValueNode [

	^ self visitNode: aRBLiteralValueNode
]

{ #category : #visiting }
BaseASTVisitor >> visitMessageNode: aRBMessageNode [
	
	^ self visitNode: aRBMessageNode  
]

{ #category : #visiting }
BaseASTVisitor >> visitMethodNode: aRBMethodNode [

	^ self visitNode: aRBMethodNode 
]

{ #category : #visiting }
BaseASTVisitor >> visitNode: aNode [ 
  "Do nothing by default. I'm meant to be overridden by subclasses"
]

{ #category : #visiting }
BaseASTVisitor >> visitSelfNode: aRBSelfNode [

	^ self visitVariableNode: aRBSelfNode
]

{ #category : #visiting }
BaseASTVisitor >> visitSequenceNode: aRBSequenceNode [

	^ self visitNode: aRBSequenceNode
]

{ #category : #visiting }
BaseASTVisitor >> visitVariableNode: aRBVariableNode [ 
	^ self visitNode: aRBVariableNode
