Class {
	#name : #Stone,
	#superclass : #Object,
	#category : #StonePaperScissors
}

{ #category : #'as yet unclassified' }
Stone >> play: anotherTool [
^anotherTool playAgainstStone: self
]

{ #category : #'as yet unclassified' }
Stone >> playAgainstPaper: aPaper [
^ #paper
]

{ #category : #'as yet unclassified' }
Stone >> playAgainstPaperbis: aPaper [
^ 1
]

{ #category : #'as yet unclassified' }
Stone >> playAgainstScissors: aScissors [
^#stone
]

{ #category : #'as yet unclassified' }
Stone >> playAgainstScissorsbis: aScissors [
^-1
]

{ #category : #'as yet unclassified' }
Stone >> playAgainstStone: aStone [
^#draw
]

{ #category : #'as yet unclassified' }
Stone >> playAgainstStonebis: aStone [
^0
]

{ #category : #'as yet unclassified' }
Stone >> playbis: anotherTool [
^anotherTool playAgainstStonebis: self
]
