"
This decorator wraps any install expression to execute it as a background process, at a standard background priority, using the available process primitives.

"
Class {
	#name : #PFBackgroundWrapper,
	#superclass : #PFWrapInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PFBackgroundWrapper >> sourceCode [

	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream
			  << '[ ';
			  nextPut: Character cr;
			  << self next sourceCode;
			  << ' ] fork.' ]
]
