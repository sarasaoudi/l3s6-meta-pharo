Class {
	#name : #SizeVisitor,
	#superclass : #Object,
	#category : #VisitorExample
}

{ #category : #visiting }
SizeVisitor >> visitDirectoryNode: aDirectoryNode [ 

	^aDirectoryNode children sum:[:each | each acceptVisitor: self ]
]

{ #category : #visiting }
SizeVisitor >> visitFileNode: aFileNode [ 

	^aFileNode size
]

