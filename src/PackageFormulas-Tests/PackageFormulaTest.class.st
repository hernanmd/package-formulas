Class {
	#name : 'PackageFormulaTest',
	#superclass : 'PackageFormulasAbstractTest',
	#category : 'PackageFormulas-Tests-Core',
	#package : 'PackageFormulas-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
PackageFormulaTest >> testAst [

	self assert: (packageFormula ast isKindOf: RBMethodNode).
	self assert: (packageFormula ast references: 'Metacello').
]

{ #category : 'tests' }
PackageFormulaTest >> testCategories [

	self assert: (packageFormula categories isKindOf: Collection).
	self assertCollection: packageFormula categories hasSameElements: #(#general).
	
	self assertCollection: packageFormulaGofer categories hasSameElements: #(#math).
	
	self assertCollection: packageFormulaEmpty categories hasSameElements: #(#general #testing).
	
	self assertCollection: packageFormulaAlt categories hasSameElements: #(#general).
]

{ #category : 'tests' }
PackageFormulaTest >> testCollectFormulaCategories [

	self assert: (packageFormula collectFormulaCategories isKindOf: Collection).
	self assertCollection: packageFormula collectFormulaCategories hasSameElements: #(#general).
	
	self assertCollection: packageFormulaGofer collectFormulaCategories hasSameElements: #(#math).
	
	self assertCollection: packageFormulaEmpty collectFormulaCategories hasSameElements: #(#general #testing).
	
	self assertCollection: packageFormulaAlt collectFormulaCategories hasSameElements: #(#general).
]

{ #category : 'tests' }
PackageFormulaTest >> testHasInstallerInstalled [

	self assert: packageFormula hasInstallerInstalled.

]

{ #category : 'tests' }
PackageFormulaTest >> testHasPackageInstalled [

	self assert: (packageFormula hasPackageInstalled isKindOf: Boolean).

]

{ #category : 'tests' }
PackageFormulaTest >> testInfo [

	self assert: (packageFormula info isKindOf: PackageFormulaInfo).

]

{ #category : 'tests' }
PackageFormulaTest >> testIsInstalled [

	self assert: (packageFormula isInstalled isKindOf: Boolean).
	self should: [ packageFormulaEmpty isInstalled ] raise: Error.
]

{ #category : 'tests' }
PackageFormulaTest >> testQuerier [

	self assert: (packageFormula querier isKindOf: PFAbstractQuerier).
	self assert: packageFormula querier class equals: PFMetacelloQuerier.
	
	self assert: (packageFormulaGofer querier isKindOf: PFAbstractQuerier).
	self assert: packageFormulaGofer querier class equals: PFGoferQuerier.

]

{ #category : 'tests' }
PackageFormulaTest >> testRepositorySchemas [

	self assert: (self packageFormula repositorySchemas isKindOf: Dictionary).
	self deny: self packageFormula repositorySchemas isEmpty.
	
	self assert: (self packageFormula repositorySchemas at: 'github') equals: 'https://github.com/'
]

{ #category : 'tests' }
PackageFormulaTest >> testSelector [

	self assert: (packageFormula selector isKindOf: Symbol).
	self assert: packageFormula selector equals: #formula:.
	
	self assert: (packageFormulaEmpty selector isKindOf: Symbol).
	self assert: packageFormulaEmpty selector equals: #formula:
]

{ #category : 'tests' }
PackageFormulaTest >> testSourceCode [

	| expectedSourceCode |
	
	expectedSourceCode := (self resource class >> #sampleFormula) ast body sourceCode.
	self assert: packageFormula sourceCode equals: expectedSourceCode.
]

{ #category : 'tests' }
PackageFormulaTest >> testlessOrEqualThan [

	self assert: packageFormula <= packageFormulaAlt

]
