Class {
	#name : #PFPostInstallDecoration,
	#superclass : #PFInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PFPostInstallDecoration >> addToPackageFormula: aPackageFormula [

	aPackageFormula addAfterDecoration: self
]

{ #category : #accessing }
PFPostInstallDecoration >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< self next sourceCode;
			cr;
			<< super sourceCode ]
]
