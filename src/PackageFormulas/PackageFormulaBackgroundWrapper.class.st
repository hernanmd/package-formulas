Class {
	#name : #PackageFormulaBackgroundWrapper,
	#superclass : #PackageFormulaWrapper,
	#instVars : [
		'link'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaBackgroundWrapper >> wrapInClass: aClass selector: aSelector [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self next wrapInClass: aClass selector: aSelector);
			<< ' ] fork.' ]
]
