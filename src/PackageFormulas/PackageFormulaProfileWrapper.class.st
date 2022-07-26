"
Measure the time to run of wrapped source code.
"
Class {
	#name : #PackageFormulaProfileWrapper,
	#superclass : #PackageFormulaWrapper,
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaProfileWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			<< ' ] timeToRun inspect.' ].
]
