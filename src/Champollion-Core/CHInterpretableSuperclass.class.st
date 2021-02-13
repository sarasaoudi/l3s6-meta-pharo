Class {
	#name : #CHInterpretableSuperclass,
	#superclass : #CHInterpretableSecondSuperclass,
	#category : #'Champollion-Core'
}

{ #category : #'as yet unclassified' }
CHInterpretableSuperclass >> isInSuperclass [
	^ true
]

{ #category : #'as yet unclassified' }
CHInterpretableSuperclass >> methodInSuperclass [
	^ 5
]

{ #category : #'as yet unclassified' }
CHInterpretableSuperclass >> overriddenMethod [ 
	^ 5
]
