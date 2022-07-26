Class {
	#name : #PFBackgroundWrapper,
	#superclass : #PFWrapInstallDecoration,
	#instVars : [
		'link'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PFBackgroundWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	self next sourceCode;
			<< ' ] fork.' ]
]
