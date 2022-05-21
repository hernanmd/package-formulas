Class {
	#name : #PackageFormulaDisableMonitorWrapper,
	#superclass : #PackageFormulaWrapper,
	#instVars : [
		'link'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaDisableMonitorWrapper >> wrapInClass: aClass selector: aSelector [

	| formulaExpression |
	formulaExpression := String streamContents: [ : stream |
		stream
			<< 'EpMonitor disableDuring: [ ';
			cr;
			<< 	(self basicInstallExpression: aClass selector: aSelector);
			<< ' ].' ].
	self evaluate: formulaExpression
]
