Class {
	#name : #PFDisableMonitorWrapper,
	#superclass : #PFWrapInstallDecoration,
	#instVars : [
		'link'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PFDisableMonitorWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< 'EpMonitor disableDuring: [ ';
			cr;
			<< 	self next sourceCode;
			<< ' ].' ].
]
