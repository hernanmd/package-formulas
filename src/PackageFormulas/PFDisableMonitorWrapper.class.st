"
Wrapper that Disables the Epicea log of its source code.
"
Class {
	#name : 'PFDisableMonitorWrapper',
	#superclass : 'PFWrapInstallDecoration',
	#category : 'PackageFormulas-Decorator',
	#package : 'PackageFormulas',
	#tag : 'Decorator'
}

{ #category : 'accessing' }
PFDisableMonitorWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream
			  << 'EpMonitor disableDuring: [ ';
			  nextPut: Character cr;
			  << self next sourceCode;
			  << ' ].' ]
]
