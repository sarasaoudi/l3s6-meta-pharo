Class {
	#name : #Paper,
	#superclass : #Object,
	#category : #StonePaperScissors
}

{ #category : #accesing }
Paper >> play: anotherTool [
^anotherTool playAgainstPaper: self
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstPaper: aPaper [
^#draw
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstPaperbis: aPaper [
^0
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstScissors: aScissors [
^ #scissors
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstScissorsbis: aScissors [
^ 1
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstStone: aStone [
^ #paper
]

{ #category : #'as yet unclassified' }
Paper >> playAgainstStonebis: aStone [
^ -1
]

{ #category : #'as yet unclassified' }
Paper >> playbis: anotherTool [ 
^anotherTool playAgainstPaperbis: self
]
