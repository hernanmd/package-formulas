"
A PFPreInstallDecorationTest is a test class for testing the behavior of PFPreInstallDecoration
"
Class {
	#name : 'PFPreInstallDecorationTest',
	#superclass : 'PFAbstractDecorationTest',
	#category : 'PackageFormulas-Tests-Decorator',
	#package : 'PackageFormulas-Tests',
	#tag : 'Decorator'
}

{ #category : 'running' }
PFPreInstallDecorationTest >> setUp [

	super setUp.
	decorator := PFPreInstallDecoration new.
]

{ #category : 'tests' }
PFPreInstallDecorationTest >> testSourceCode [

	self assert: decorator next equals: nil.
	self should: [ decorator sourceCode ] raise: MessageNotUnderstood.
	decorator setNext: self newMockEmptyInstallation.
	self assert: decorator sourceCode trimBoth equals: String empty.
	
	decorator setNext: self newMockPackageFormula.
	self assert: decorator sourceCode trimBoth equals: self expectedSource.
]
