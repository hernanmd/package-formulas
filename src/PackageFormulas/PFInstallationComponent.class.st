Class {
	#name : #PFInstallationComponent,
	#superclass : #Object,
	#instVars : [
		'name',
		'decoration',
		'next',
		'sourceCode'
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
PFInstallationComponent >> addDecoration: aPackageFormulaDecoration [

	| previous current |

	previous := nil.
	current := self decoration.
	[ current ~~ self ] whileTrue: [ 
		previous := current.
		current := current next ].
	self setNext: current.
	aPackageFormulaDecoration setNext: self.
	previous
		ifNil: [ self decoration: aPackageFormulaDecoration ]
		ifNotNil: [ :arg | previous setNext: aPackageFormulaDecoration ].
	^ aPackageFormulaDecoration
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

{ #category : #'accessing - decorators' }
PFInstallationComponent >> decoration [

	^ decoration
		  ifNil: [ decoration := self ]
		  ifNotNil: [ :arg | decoration contents ]
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> decoration: aDecoration [

	decoration contents: aDecoration
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
	decoration := ValueHolder new contents: self.
]

{ #category : #initialization }
PFInstallationComponent >> initializeAfterDecoration [

	afterDecoration := ValueHolder new contents: self
]

{ #category : #initialization }
PFInstallationComponent >> initializeAroundDecoration [

	aroundDecoration := ValueHolder new contents: self.

]

{ #category : #initialization }
PFInstallationComponent >> initializeBeforeDecoration [

	beforeDecoration := ValueHolder new contents: self.

]

{ #category : #accessing }
PFInstallationComponent >> install [

	self halt.
	self evaluate: self sourceCode.
]

{ #category : #accessing }
PFInstallationComponent >> name [

	^ name
]

{ #category : #accessing }
PFInstallationComponent >> name: anObject [

	name := anObject
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> next [
	"Answer the next decoration or component."

	^ next contents
]

{ #category : #accessing }
PFInstallationComponent >> nextAfter [

	^ nextAfter
]

{ #category : #'accessing - deco' }
PFInstallationComponent >> nextAround [
	"Answer the next decoration or component."

	^ nextAround contents
]

{ #category : #accessing }
PFInstallationComponent >> nextBefore [

	^ nextBefore
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

{ #category : #'accessing - decorators' }
PFInstallationComponent >> removeDecoration: aDecoration [
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self decoration.
	[ current = self ] whileFalse: [ 
		current = aDecoration ifTrue: [ 
			previous
				ifNil: [ self decoration: current next ]
				ifNotNil: [ :arg | previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #accessing }
PFInstallationComponent >> setNext: aDecoration [
	next contents: aDecoration
]

{ #category : #'accessing - deco' }
PFInstallationComponent >> setNextAfter: aDecoration [
	nextAfter contents: aDecoration
]

{ #category : #'accessing - deco' }
PFInstallationComponent >> setNextAround: aDecoration [
	nextAround contents: aDecoration
]

{ #category : #'accessing - deco' }
PFInstallationComponent >> setNextBefore: aDecoration [

	nextBefore contents: aDecoration
]

{ #category : #accessing }
PFInstallationComponent >> sourceCode [
	"Answer the receivers installation <String>"

	^ sourceCode
]

{ #category : #accessing }
PFInstallationComponent >> sourceCode: aString [

	sourceCode := aString
]
