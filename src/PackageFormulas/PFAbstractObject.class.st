"
Provides subclasses a holder for a `PackageFormula`.
"
Class {
	#name : 'PFAbstractObject',
	#superclass : 'Object',
	#instVars : [
		'packageFormula'
	],
	#category : 'PackageFormulas-Core',
	#package : 'PackageFormulas',
	#tag : 'Core'
}

{ #category : 'accessing' }
PFAbstractObject >> packageFormula [

	^ packageFormula
]

{ #category : 'accessing' }
PFAbstractObject >> packageFormula: anObject [

	packageFormula := anObject
]

{ #category : 'parsing' }
PFAbstractObject >> packageFormulaAst [
	"Answer the package formula's <RBMethodNode>"

	^ self packageFormula ast
]
