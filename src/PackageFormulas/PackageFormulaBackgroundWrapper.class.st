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

	| formulaExpression |
	formulaExpression := String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self basicInstallExpression: aClass selector: aSelector);
			<< ' ] fork.' ].
	self evaluate: formulaExpression
]
