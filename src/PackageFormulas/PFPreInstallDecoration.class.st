Class {
	#name : #PFPreInstallDecoration,
	#superclass : #PFInstallationComponent,
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PFPreInstallDecoration >> sourceCode [

	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream << super sourceCode.
		  (super sourceCode endsWith: '.') ifFalse: [ 
			  stream << $. ].
		  stream
			  nextPut: Character cr;
			  << self next sourceCode ]
]
