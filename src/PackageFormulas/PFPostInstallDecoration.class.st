Class {
	#name : #PFPostInstallDecoration,
	#superclass : #PFInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PFPostInstallDecoration >> addToPackageFormula: aPackageFormula [

	aPackageFormula addAfterDecoration: self
]

{ #category : #private }
PFPostInstallDecoration >> sourceCode [
	" Private - See superimplementor's comment"

	self halt.
	^ String streamContents: [ : stream |
		stream
			<< self nextAfter sourceCode;
			<< super sourceCode ]
]
