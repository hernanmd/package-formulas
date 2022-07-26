"
Measure the time to run of wrapped source code.
"
Class {
	#name : #PFProfileWrapper,
	#superclass : #PFWrapInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PFProfileWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< self next sourceCode;
			<< ' ] timeToRun inspect.' ].
]
