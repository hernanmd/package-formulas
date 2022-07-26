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

{ #category : #accessing }
PFExceptionWrapper >> sourceCode [

	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream
				<< '[ ';
				nextPut: Character cr;
				<< self next sourceCode;
				nextPut: Character cr;
				<< ' ] on: ';
				nextPut: Character cr;		
				<< self exceptionClass greaseString;
				nextPut: Character cr;
				<< 'do: ';
				<< self exceptionBlock storeString ]
]
