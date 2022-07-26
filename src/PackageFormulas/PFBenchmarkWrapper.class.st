"
Wraps a Pharo expression to measure its execution time.

"
Class {
	#name : #PFBenchmarkWrapper,
	#superclass : #PFWrapInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PFBenchmarkWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< self next sourceCode;
			<< ' ] bench.' ].
]
