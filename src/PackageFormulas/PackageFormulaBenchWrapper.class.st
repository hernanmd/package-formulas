"
Wraps a Pharo expression to measure its execution time.

"
Class {
	#name : #PackageFormulaBenchWrapper,
	#superclass : #PackageFormulaWrapper,
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaBenchWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			<< ' ] bench.' ].
]
