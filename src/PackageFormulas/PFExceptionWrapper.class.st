Class {
	#name : #PFExceptionWrapper,
	#superclass : #PFWrapInstallDecoration,
	#instVars : [
		'exceptionClass',
		'exceptionBlock'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PFExceptionWrapper >> exceptionBlock [

	^ exceptionBlock
		ifNil: [ exceptionBlock := '[ : ex | ex load ]' ]
]

{ #category : #private }
PFExceptionWrapper >> exceptionClass [

	^ exceptionClass
		ifNil: [ exceptionClass := MCMergeOrLoadWarning ]
]

{ #category : #accessing }
PFExceptionWrapper >> exceptionClass: anObject [

	exceptionClass := anObject
]

{ #category : #private }
PFExceptionWrapper >> sourceCode [
	" Private - See superimplementor's comment"

	self halt.
	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< self next sourceCode;
			cr;
			<< ' ] on: ';
			<< self exceptionClass asString;
			cr;
			<< 'do: ';
			<< self exceptionBlock storeString ].
]

{ #category : #accessing }
PFExceptionWrapper >> sourceCode: aString [ 

	exceptionBlock := aString
]
