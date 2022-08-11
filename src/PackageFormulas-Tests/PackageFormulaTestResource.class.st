Class {
	#name : #PackageFormulaTestResource,
	#superclass : #TestResource,
	#category : #'PackageFormulas-Tests-Core'
}

{ #category : #running }
PackageFormulaTestResource >> newMockEmptyPackageFormula [

	^ PackageFormula newFrom: self samplePragmaEmpty
]

{ #category : #'instance creation' }
PackageFormulaTestResource >> newMockEmptyPackageFormulaAlt [

	^  PackageFormula newFrom: self samplePragmaEmpty
]

{ #category : #'instance creation' }
PackageFormulaTestResource >> newMockEmptyPackageFormulaGofer [

	^  PackageFormula newFrom: self samplePragmaEmpty
]

{ #category : #'instance creation' }
PackageFormulaTestResource >> newMockPackageFormula [

	^ PackageFormula newFrom: self samplePragma
]

{ #category : #'instance creation' }
PackageFormulaTestResource >> newMockPackageFormulaAlt [

	^ PackageFormula newFrom: self samplePragmaAlt
]

{ #category : #'instance creation' }
PackageFormulaTestResource >> newMockPackageFormulaGofer [

	^ PackageFormula newFrom: self samplePragmaGofer
]

{ #category : #'instance creation' }
PackageFormulaTestResource >> newNonPackageFormula [

	^ PackageFormula newFrom: self samplePragmaNonFormula
]

{ #category : #accessing }
PackageFormulaTestResource >> nonSampleFormula [

]

{ #category : #accessing }
PackageFormulaTestResource >> sampleFormula [
	<formula: #general>

	Metacello new
		baseline: 'PackageFormulas';
		repository: 'github://hernanmd/package-formulas';
		load.
]

{ #category : #accessing }
PackageFormulaTestResource >> sampleFormulaAlt [
	<formula: #general>

	Metacello new
		githubUser: 'pharo-contributions' project: 'Artefact' commitish: 'master' path: 'src';
		baseline: 'Artefact';
		load
]

{ #category : #accessing }
PackageFormulaTestResource >> sampleFormulaEmpty [
	<formula: #general>
	<formula: #testing>

]

{ #category : #accessing }
PackageFormulaTestResource >> sampleFormulasGofer [
	<formula: #math>

	Gofer new
		url: 'https://github.com/grpistoia/Mathemagics';
		package: 'Mathemagics';
		load.
]

{ #category : #running }
PackageFormulaTestResource >> samplePragma [

	^ (self class >> #sampleFormula) pragmas anyOne
]

{ #category : #running }
PackageFormulaTestResource >> samplePragmaAlt [

	^ (self class >> #sampleFormulaAlt) pragmas anyOne
]

{ #category : #running }
PackageFormulaTestResource >> samplePragmaEmpty [

	^ (self class >> #sampleFormulaEmpty) pragmas anyOne
]

{ #category : #running }
PackageFormulaTestResource >> samplePragmaGofer [

	^ (self class >> #sampleFormulasGofer) pragmas anyOne
]

{ #category : #running }
PackageFormulaTestResource >> samplePragmaNonFormula [

	^ (self class >> #nonSampleFormula) pragmas anyOne
]
