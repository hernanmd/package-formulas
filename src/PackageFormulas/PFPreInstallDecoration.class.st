Class {
	#name : #PFPreInstallDecoration,
	#superclass : #PFInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PFPreInstallDecoration >> addToPackageFormula: aPackageFormula [

	aPackageFormula addBeforeDecoration: self
]

{ #category : #accessing }
PFPreInstallDecoration >> sourceCode [

	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream << super sourceCode.
		  (super sourceCode endsWithSubCollection: '.') ifFalse: [ 
			  stream << $. ].
		  stream
			  nextPut: Character cr;
			  << self next sourceCode ]
]
