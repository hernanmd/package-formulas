"
A PFAbstractObjectTest is a test class for testing the behavior of PFAbstractObject
"
Class {
	#name : #PFAbstractObjectTest,
	#superclass : #PackageFormulasAbstractTest,
	#instVars : [
		'querier'
	],
	#category : #'PackageFormulas-Tests-Core'
}

{ #category : #running }
PFAbstractObjectTest >> setUp [

	super setUp.
	querier := PFMetacelloQuerier new
		packageFormula: self newMockPackageFormula;
		yourself.
]

{ #category : #tests }
PFAbstractObjectTest >> testPackageFormula [

	self assert: (querier packageFormula isKindOf: PackageFormula)
]

{ #category : #tests }
PFAbstractObjectTest >> testPackageFormulaAst [

	self assert: (querier packageFormulaAst isKindOf: RBMethodNode).
]
