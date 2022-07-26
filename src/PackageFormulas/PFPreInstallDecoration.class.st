Class {
	#name : #PFPreInstallDecoration,
	#superclass : #PFInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PFPreInstallDecoration >> addToPackageFormula: aPackageFormula [

	aPackageFormula addBeforeDecoration: self
]

{ #category : #private }
PFPreInstallDecoration >> sourceCode [
	" Private - See superimplementor's comment"

	self halt.
	^ String streamContents: [ : stream |
		stream
			<< super sourceCode.
		(super sourceCode endsWithSubCollection: '.'	)
			ifFalse: [ stream << $. ].
		stream
			cr;
			<< 	self nextBefore sourceCode ]
]
