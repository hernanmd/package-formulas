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
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< 'EpMonitor disableDuring: [ ';
			cr;
			<< 	(self next wrapInClass: aClass selector: aSelector);
			<< ' ].' ].
]
