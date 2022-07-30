Class {
	#name : #PFDisableMonitorWrapper,
	#superclass : #PFWrapInstallDecoration,
	#category : #'PackageFormulas-Core'
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
