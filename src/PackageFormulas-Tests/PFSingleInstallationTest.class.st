"
A PFSingleInstallationTest is a test class for testing the behavior of PFSingleInstallation
"
Class {
	#name : 'PFSingleInstallationTest',
	#superclass : 'PFAbstractDecorationTest',
	#category : 'PackageFormulas-Tests-Decorator',
	#package : 'PackageFormulas-Tests',
	#tag : 'Decorator'
}

{ #category : 'tests' }
PFSingleInstallationTest >> expectedSource [

	^ 'Metacello new
		baseline: ''PackageFormulas'';
		repository: ''github://hernanmd/package-formulas'';
		load.
Metacello new
		githubUser: ''pharo-contributions'' project: ''Artefact'' commitish: ''master'' path: ''src'';
		baseline: ''Artefact'';
		load.
Gofer new
		url: ''https://github.com/grpistoia/Mathemagics'';
		package: ''Mathemagics'';
		load.'
]

{ #category : 'running' }
PFSingleInstallationTest >> setUp [

	super setUp.
	decorator := PFSingleInstallation new.
]

{ #category : 'tests' }
PFSingleInstallationTest >> testUsingFormulas [

	self assert: decorator sourceCode trimBoth equals: String empty.
	decorator usingFormulas: self newMockEmptyFormulas.
	self assert: decorator sourceCode trimBoth equals: String empty.
	
	decorator usingFormulas: self newMockFormulas.
	self assert: decorator sourceCode equals: self expectedSource
]
