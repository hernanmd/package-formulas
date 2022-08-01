Class {
	#name : #PackageFormulasAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'packageFormula',
		'packageFormulaGofer',
		'packageFormulaEmpty',
		'packageFormulaAlt'
	],
	#category : #'PackageFormulas-Tests'
}

{ #category : #accessing }
PackageFormulasAbstractTest class >> resources [

	^ Array with: PackageFormulaTestResource
]

{ #category : #running }
PackageFormulasAbstractTest >> newPackageFormula [

	^ self resource newPackageFormula
]

{ #category : #running }
PackageFormulasAbstractTest >> newPackageFormulaAlt [

	^ self resource newPackageFormulaAlt
]

{ #category : #running }
PackageFormulasAbstractTest >> newPackageFormulaEmpty [

	^ self resource newPackageFormulaEmpty
]

{ #category : #running }
PackageFormulasAbstractTest >> newPackageFormulaGofer [

	^ self resource newPackageFormulaGofer
]

{ #category : #accessing }
PackageFormulasAbstractTest >> packageFormula [

	^ packageFormula
]

{ #category : #accessing }
PackageFormulasAbstractTest >> packageFormula: anObject [

	packageFormula := anObject
]

{ #category : #running }
PackageFormulasAbstractTest >> resource [

	^ PackageFormulaTestResource current
]

{ #category : #running }
PackageFormulasAbstractTest >> setUp [

	super setUp.
	packageFormula := self newPackageFormula.
	packageFormulaGofer := self newPackageFormulaGofer.
	packageFormulaEmpty := self newPackageFormulaEmpty.
	packageFormulaAlt := self newPackageFormulaAlt.
]
