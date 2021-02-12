Class {
	#name : #SearchVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'token'
	],
	#category : #VisitorExample
}

{ #category : #accessing }
SearchVisitor >> token: aToken [ 
	token := aToken
]

{ #category : #accessing }
SearchVisitor >> visitLiteralNode: aNode [ 
	^ (aNode value asString beginsWith: token)
			ifTrue: [ { aNode } ]
			ifFalse: [ #() ]
]

{ #category : #accessing }
SearchVisitor >> visitMessageNode: aNode [ 
	^ (aNode receiver acceptVisitor: self),
	  ((aNode selector beginsWith: token)
	    ifTrue: [ { aNode } ]
	    ifFalse: [ #() ]),
	   (aNode arguments gather: [ :each | each acceptVisitor: self ])
]

{ #category : #accessing }
SearchVisitor >> visitNode: aNode [ 
	
	^ aNode children gather: [ :each | each acceptVisitor: self ]
]

{ #category : #accessing }
SearchVisitor >> visitVariableNode: aNode [ 

	^ (aNode name beginsWith: token)
			ifTrue: [ { aNode } ]
			ifFalse: [ #() ]
]
