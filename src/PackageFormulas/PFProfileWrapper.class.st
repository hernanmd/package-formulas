"
Measure the time to run of wrapped source code.
"
Class {
	#name : 'PFProfileWrapper',
	#superclass : 'PFWrapInstallDecoration',
	#category : 'PackageFormulas-Decorator',
	#package : 'PackageFormulas',
	#tag : 'Decorator'
}

{ #category : 'accessing' }
PFProfileWrapper >> sourceCode [

	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream
			  << '[ ';
			  nextPut: Character cr;
			  << self next sourceCode;
			  << ' ] timeToRun inspect.' ]
]
