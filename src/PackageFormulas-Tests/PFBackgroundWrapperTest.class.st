"
A PFBackgroundWrapperTest is a test class for testing the behavior of PFBackgroundWrapper
"
Class {
	#name : 'PFBackgroundWrapperTest',
	#superclass : 'PFAbstractDecorationTest',
	#category : 'PackageFormulas-Tests-Decorator',
	#package : 'PackageFormulas-Tests',
	#tag : 'Decorator'
}

{ #category : 'tests' }
PFBackgroundWrapperTest >> expectedSource [

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			<< Character cr;
			<< super expectedSource;
			<< ' ] fork.' ]
]

{ #category : 'running' }
PFBackgroundWrapperTest >> setUp [

	super setUp.
	decorator := PFBackgroundWrapper new.
]

{ #category : 'tests' }
PFBackgroundWrapperTest >> testSourceCode [

	self assert: decorator next equals: nil.
	self should: [ decorator sourceCode ] raise: MessageNotUnderstood.
	decorator setNext: self newMockEmptyInstallation.
	self assert: (decorator sourceCode trimBoth beginsWith: '[').
	self assert: (decorator sourceCode trimBoth endsWith: '] fork.').
	
	decorator setNext: self newMockPackageFormula.
	self assert: (decorator sourceCode trimBoth beginsWith: '[').
	self assert: (decorator sourceCode trimBoth endsWith: '] fork.').	
	self assert: decorator sourceCode trimBoth equals: self expectedSource.
]
