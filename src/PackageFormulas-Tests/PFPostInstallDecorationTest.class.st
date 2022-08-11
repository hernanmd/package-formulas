"
A PFPostInstallDecorationTest is a test class for testing the behavior of PFPostInstallDecoration
"
Class {
	#name : #PFPostInstallDecorationTest,
	#superclass : #PFAbstractDecorationTest,
	#category : #'PackageFormulas-Tests-Decorator'
}

{ #category : #running }
PFPostInstallDecorationTest >> setUp [

	super setUp.
	decorator := PFPostInstallDecoration new.
]

{ #category : #tests }
PFPostInstallDecorationTest >> testSourceCode [

	self assert: decorator next equals: nil.
	self should: [ decorator sourceCode ] raise: MessageNotUnderstood.
	decorator setNext: self newMockEmptyInstallation.
	self assert: decorator sourceCode trimBoth equals: String empty.
	
	decorator setNext: self newMockPackageFormula.
	self assert: decorator sourceCode trimBoth equals: self expectedSource.
]
