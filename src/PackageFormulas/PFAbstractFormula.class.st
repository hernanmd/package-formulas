"
Provides subclasses a holder for a `PackageFormula`.
"
Class {
	#name : #PFAbstractFormula,
	#superclass : #Object,
	#instVars : [
		'packageFormula'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PFAbstractFormula >> packageFormula [

	^ packageFormula
]

{ #category : #accessing }
PFAbstractFormula >> packageFormula: anObject [

	packageFormula := anObject
]

{ #category : #parsing }
PFAbstractFormula >> packageFormulaAst [
	"Answer the package formula's <RBMethodNode>"

	^ self packageFormula ast
]
