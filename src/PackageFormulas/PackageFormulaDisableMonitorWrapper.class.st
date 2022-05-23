Class {
	#name : #PackageFormulaDisableMonitorWrapper,
	#superclass : #PackageFormulaWrapper,
	#instVars : [
		'link'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaDisableMonitorWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< 'EpMonitor disableDuring: [ ';
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			<< ' ].' ].
]
