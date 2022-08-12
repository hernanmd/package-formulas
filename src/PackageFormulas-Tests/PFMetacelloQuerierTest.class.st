"
A PFMetacelloQuerierTest is a test class for testing the behavior of PFMetacelloQuerier
"
Class {
	#name : #PFMetacelloQuerierTest,
	#superclass : #PackageFormulasAbstractTest,
	#instVars : [
		'querier'
	],
	#category : #'PackageFormulas-Tests-Core'
}

{ #category : #running }
PFMetacelloQuerierTest >> setUp [

	super setUp.
	querier := PFMetacelloQuerier new
		packageFormula: self newMockPackageFormula;
		yourself.

]

{ #category : #tests }
PFMetacelloQuerierTest >> testDefinitionName [

	self assert: (querier definitionName isKindOf: String).
	self assert: querier definitionName equals: 'PackageFormulas'.

	querier packageFormula: self newMockEmptyPackageFormula.
	self assert: querier definitionName equals: String empty.
	
	querier packageFormula: self newMockPackageFormulaGofer.
	self assert: querier definitionName equals: String empty.
	
	querier packageFormula: self newMockPackageFormulaAlt.
	self assert: querier definitionName equals: 'Artefact'.
	
	querier packageFormula: self newMockPackageFormulaNoBaseline.
	self assert: querier definitionName equals: String empty.
	
	querier packageFormula: nil.
	self should: [ querier definitionName ] raise: MessageNotUnderstood.
]

{ #category : #test }
PFMetacelloQuerierTest >> testHasInstallerInstalled [

	self assert: querier hasInstallerInstalled.
	querier packageFormula: self newMockEmptyPackageFormula.
	self deny: querier hasInstallerInstalled.

]

{ #category : #test }
PFMetacelloQuerierTest >> testHasPackageInstalled [

	self assert: querier hasPackageInstalled.
	
	querier packageFormula: self newMockEmptyPackageFormula.
	self deny: querier hasPackageInstalled.
]
