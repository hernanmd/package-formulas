Class {
	#name : #PackageFormulaBackgroundWrapper,
	#superclass : #PackageFormulaWrapper,
	#instVars : [
		'link'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaBackgroundWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			<< ' ] fork.' ]
]
