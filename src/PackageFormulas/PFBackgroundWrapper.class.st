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
