"
Disables the lEpicea ogging of its installation expression.
"
Class {
	#name : #PFDisableMonitorWrapper,
	#superclass : #PFWrapInstallDecoration,
	#category : #'PackageFormulas-Decorator'
}

{ #category : #accessing }
PFDisableMonitorWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream
			  << 'EpMonitor disableDuring: [ ';
			  nextPut: Character cr;
			  << self next sourceCode;
			  << ' ].' ]
]
