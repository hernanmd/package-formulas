Class {
	#name : #PFInstallationComponent,
	#superclass : #Object,
	#instVars : [
		'next',
		'name',
		'beforeDecoration',
		'afterDecoration',
		'aroundDecoration'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #'instance creation' }
PFInstallationComponent class >> named: aString [
	"Answer a new decoration named aString"

	^ self new
		name: aString;
		yourself
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> addAfterDecoration: aPackageFormulaDecoration [

	| previous current |
	previous := nil.
	current := self afterDecoration.
	[ current ~~ self ] whileTrue: [
		previous := current.
		current := current next ].
	aPackageFormulaDecoration setNext: current.
	previous
		ifNil: [ self afterDecoration: aPackageFormulaDecoration ]
		ifNotNil: [ previous setNext: aPackageFormulaDecoration ].
	^ aPackageFormulaDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> addAroundDecoration: aPackageFormulaDecoration [

	| previous current |
	previous := nil.
	current := self aroundDecoration.
	[ current ~~ self ] whileTrue: [
		previous := current.
		current := current next ].
	aPackageFormulaDecoration setNext: current.
	previous
		ifNil: [ self aroundDecoration: aPackageFormulaDecoration ]
		ifNotNil: [ previous setNext: aPackageFormulaDecoration ].
	^ aPackageFormulaDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> addBeforeDecoration: aPackageFormulaDecoration [

	| previous current |
	previous := nil.
	current := self beforeDecoration.
	[ current ~~ self ] whileTrue: [
		previous := current.
		current := current next ].
	aPackageFormulaDecoration setNext: current.
	previous
		ifNil: [ self beforeDecoration: aPackageFormulaDecoration ]
		ifNotNil: [ previous setNext: aPackageFormulaDecoration ].
	^ aPackageFormulaDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> addDecoration: aDecoration [
	"Add aDecoration to the receivers decoration chain. Answer the added decoration."
	
	aDecoration addToPackageFormula: self
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> afterDecoration [

	^ afterDecoration 
		ifNil: [ afterDecoration := self ]
		ifNotNil: [ afterDecoration contents ]
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> afterDecoration: aDecoration [

	afterDecoration contents: aDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> aroundDecoration [

	^ aroundDecoration 
		ifNotNil: [: deco | deco contents ]
		ifNil: [ nil ]
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> aroundDecoration: aDecoration [

	aroundDecoration contents: aDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> beforeDecoration [

	^ beforeDecoration 
		ifNil: [ beforeDecoration := self ]
		ifNotNil: [ beforeDecoration contents ]
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> beforeDecoration: aDecoration [

	beforeDecoration contents: aDecoration
]

{ #category : #'public access' }
PFInstallationComponent >> evaluate: aFormulaExpression [
	"Private - Evaluate Smalltalk code in aFormulaExpression"

	Smalltalk compiler evaluate: aFormulaExpression.
]

{ #category : #initialization }
PFInstallationComponent >> initialize [

	super initialize.
	next := ValueHolder new.
	aroundDecoration := ValueHolder new contents: self.
	beforeDecoration := ValueHolder new contents: self.
	afterDecoration := ValueHolder new contents: self
]

{ #category : #accessing }
PFInstallationComponent >> name [

	^ name
]

{ #category : #accessing }
PFInstallationComponent >> name: anObject [

	name := anObject
]

{ #category : #'accessing - deco' }
PFInstallationComponent >> next [
	"Answer the next decoration or component."

	^ next contents
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> removeAfterDecoration: aDecoration [ 
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self afterDecoration.
	[ current = self ] whileFalse: [
		current = aDecoration ifTrue: [
			previous isNil
				ifTrue: [ self afterDecoration: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> removeAroundDecoration: aDecoration [ 
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self aroundDecoration.
	[ current = self ] whileFalse: [
		current = aDecoration ifTrue: [
			previous isNil
				ifTrue: [ self aroundDecoration: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> removeBeforeDecoration: aDecoration [ 
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self beforeDecoration.
	[ current = self ] whileFalse: [
		current = aDecoration ifTrue: [
			previous isNil
				ifTrue: [ self beforeDecoration: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #'accessing - deco' }
PFInstallationComponent >> setNext: aDecoration [
	next contents: aDecoration
]
