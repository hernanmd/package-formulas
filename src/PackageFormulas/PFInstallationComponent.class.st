"
This decoration just provides subclasses sourceCode state `String`. See subclasses for specific functionality using source code.
"
Class {
	#name : #PFInstallationComponent,
	#superclass : #Object,
	#instVars : [
		'name',
		'decoration',
		'next',
		'sourceCode'
	],
	#category : #'PackageFormulas-Decorator'
}

{ #category : #'instance creation' }
PFInstallationComponent class >> named: aString [
	"Answer a new decoration named aString"

	^ self new
		name: aString;
		yourself
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

{ #category : #accessing }
PFInstallationComponent >> install [

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

{ #category : #'accessing - decorators' }
PFInstallationComponent >> setNext: aDecoration [
	next contents: aDecoration
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
