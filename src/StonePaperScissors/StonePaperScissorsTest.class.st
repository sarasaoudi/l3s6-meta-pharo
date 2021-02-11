Class {
	#name : #StonePaperScissorsTest,
	#superclass : #TestCase,
	#category : #StonePaperScissors
}

{ #category : #tests }
StonePaperScissorsTest >> testPaperIsWinning [
self assert: (Stone new play: Paper new) = #paper

]

{ #category : #tests }
StonePaperScissorsTest >> testPaperIsWinningbis [
self assert: (Stone new playbis: Paper new) equals: -1

]

{ #category : #tests }
StonePaperScissorsTest >> testScissors2IsWinning [
self assert: (Scissors new play: Stone new) = #stone

]

{ #category : #tests }
StonePaperScissorsTest >> testScissors2IsWinningbis [
self assert: (Scissors new playbis: Stone new) equals: -1

]

{ #category : #tests }
StonePaperScissorsTest >> testScissorsIsWinning [
self assert: (Scissors new play: Paper new) = #scissors

]

{ #category : #tests }
StonePaperScissorsTest >> testScissorsIsWinningbis [
self assert: (Scissors new playbis: Paper new) equals: 1

]

{ #category : #tests }
StonePaperScissorsTest >> testStoneAgainsStone [
self assert: (Stone new play: Stone new) = #draw

]

{ #category : #tests }
StonePaperScissorsTest >> testStoneAgainsStonebis [
self assert: (Stone new playbis: Stone new) = 0

]
