Class {
	#name : #PFInstallationComponent,
	#superclass : #Object,
	#instVars : [
		'nextBefore',
		'nextAfter',
		'name',
		'beforeDecoration',
		'afterDecoration',
		'aroundDecoration',
		'sourceCode',
		'nextAround'
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
		current := current nextAfter ].
	aPackageFormulaDecoration setNextAfter: current.
	previous
		ifNil: [ self afterDecoration: aPackageFormulaDecoration ]
		ifNotNil: [ :arg | previous setNextAfter: aPackageFormulaDecoration ].
	^ aPackageFormulaDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> addAroundDecoration: aPackageFormulaDecoration [

	| previous current |
	previous := nil.
	current := self aroundDecoration.
	[ current ~~ self ] whileTrue: [ 
		previous := current.
		current := current nextAround ].
	aPackageFormulaDecoration setNextAround: current.
	previous
		ifNil: [ self aroundDecoration: aPackageFormulaDecoration ]
		ifNotNil: [ :arg | 
		previous setNextAround: aPackageFormulaDecoration ].
	^ aPackageFormulaDecoration
]

{ #category : #'accessing - decorators' }
PFInstallationComponent >> addBeforeDecoration: aPackageFormulaDecoration [

	| previous current |
	previous := nil.
	current := self beforeDecoration.
	[ current ~~ self ] whileTrue: [
		previous := current.
		current := current nextBefore ].
	aPackageFormulaDecoration setNextBefore: current.
	previous
		ifNil: [ self beforeDecoration: aPackageFormulaDecoration ]
		ifNotNil: [ previous setNextBefore: aPackageFormulaDecoration ].
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
	nextAround := ValueHolder new.
	self 
		initializeAroundDecoration;
		initializeAfterDecoration;
		initializeBeforeDecoration.
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
	self evaluate: self packageFormula sourceCode.
]

{ #category : #accessing }
PFInstallationComponent >> name [

	^ name
]

{ #category : #accessing }
PFInstallationComponent >> name: anObject [

	name := anObject
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
			previous
				ifNil: [ self afterDecoration: current nextAfter ]
				ifNotNil: [ :arg | previous setNextAfter: current nextAfter ].
			^ aDecoration setNextAfter: nil ].
		previous := current.
		current := current nextAfter ].
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
			previous
				ifNil: [ self aroundDecoration: current nextAround ]
				ifNotNil: [ :arg | previous setNextAround: current nextAround ].
			^ aDecoration setNextAround: nil ].
		previous := current.
		current := current nextAround ].
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
			previous
				ifNil: [ self beforeDecoration: current nextBefore ]
				ifNotNil: [ :arg | previous setNextBefore: current nextBefore ].
			^ aDecoration setNextBefore: nil ].
		previous := current.
		current := current nextBefore ].
	^ nil
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
