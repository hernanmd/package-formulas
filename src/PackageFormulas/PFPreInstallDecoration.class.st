"
This decoration first write its source code, and then append the previously code chain in its decoration chain (up to the `PackageFormula` installation expression).
"
Class {
	#name : #PFPreInstallDecoration,
	#superclass : #PFInstallationComponent,
	#category : #'PackageFormulas-Decorator'
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
