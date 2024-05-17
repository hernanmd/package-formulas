Class {
	#name : 'PackageFormulasAbstractTest',
	#superclass : 'TestCase',
	#instVars : [
		'packageFormula',
		'packageFormulaGofer',
		'packageFormulaEmpty',
		'packageFormulaAlt'
	],
	#category : 'PackageFormulas-Tests-Core',
	#package : 'PackageFormulas-Tests',
	#tag : 'Core'
}

{ #category : 'accessing' }
PackageFormulasAbstractTest class >> resources [

	^ Array with: PackageFormulaTestResource
]

{ #category : 'test' }
PackageFormulasAbstractTest >> newMockEmptyFormulas [

	^ { 
		self newMockEmptyPackageFormula .
		self newMockEmptyPackageFormulaAlt .
		self newMockEmptyPackageFormulaGofer }
]

{ #category : 'test' }
PackageFormulasAbstractTest >> newMockEmptyInstallation [

	^ PFSingleInstallation newWithFormulas: self newMockEmptyFormulas
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockEmptyPackageFormula [

	^ self resource newMockEmptyPackageFormula
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockEmptyPackageFormulaAlt [

	^ self resource newMockEmptyPackageFormulaAlt
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockEmptyPackageFormulaGofer [

	^ self resource newMockEmptyPackageFormulaGofer
]

{ #category : 'test' }
PackageFormulasAbstractTest >> newMockFormulas [

	^ { 
		self newMockPackageFormula .
		self newMockPackageFormulaAlt .
		self newMockPackageFormulaGofer }
]

{ #category : 'test' }
PackageFormulasAbstractTest >> newMockInstallation [

	^ PFSingleInstallation newWithFormulas: self newMockFormulas
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockPackageFormula [

	^ self resource newMockPackageFormula
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockPackageFormulaAlt [

	^ self resource newMockPackageFormulaAlt
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockPackageFormulaGofer [

	^ self resource newMockPackageFormulaGofer
]

{ #category : 'tests' }
PackageFormulasAbstractTest >> newMockPackageFormulaNoBaseline [

	^ self resource newMockPackageFormulaNoBaseline
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newMockPackageFormulaWithBranchName [

	^ self resource newMockPackageFormulaWithBranchName
]

{ #category : 'running' }
PackageFormulasAbstractTest >> newNonPackageFormula [

	^ self resource newNonPackageFormula
]

{ #category : 'accessing' }
PackageFormulasAbstractTest >> packageFormula [

	^ packageFormula
]

{ #category : 'accessing' }
PackageFormulasAbstractTest >> packageFormula: anObject [

	packageFormula := anObject
]

{ #category : 'running' }
PackageFormulasAbstractTest >> resource [

	^ PackageFormulaTestResource current
]

{ #category : 'running' }
PackageFormulasAbstractTest >> setUp [

	super setUp.
	packageFormula := self newMockPackageFormula.
	packageFormulaGofer := self newMockPackageFormulaGofer.
	packageFormulaEmpty := self newMockEmptyPackageFormula.
	packageFormulaAlt := self newMockPackageFormulaAlt.
]
