Class {
	#name : #Scissors,
	#superclass : #Object,
	#category : #StonePaperScissors
}

{ #category : #'as yet unclassified' }
Scissors >> play: anotherTool [
^anotherTool playAgainstScissors: self
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstPaper: aPaper [
^#scissors
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstPaperbis: aPaper [
^-1
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstScissors: aScissors [
^#draw
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstScissorsbis: aScissors [
^0
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstStone: aStone [
^ 1
]

{ #category : #'as yet unclassified' }
Scissors >> playAgainstStonebis: aStone [
^ 1
]

{ #category : #'as yet unclassified' }
Scissors >> playbis: anotherTool [
^anotherTool playAgainstScissorsbis: self
]
