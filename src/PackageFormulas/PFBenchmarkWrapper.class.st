"
Wraps a Pharo expression to measure its execution time.

"
Class {
	#name : 'PFBenchmarkWrapper',
	#superclass : 'PFWrapInstallDecoration',
	#category : 'PackageFormulas-Decorator',
	#package : 'PackageFormulas',
	#tag : 'Decorator'
}

{ #category : 'accessing' }
PFBenchmarkWrapper >> sourceCode [

	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream
			  << '[ ';
			  nextPut: Character cr;
			  << self next sourceCode;
			  << ' ] bench.' ]
]
