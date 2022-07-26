Class {
	#name : #PackageFormulaExceptionWrapper,
	#superclass : #PackageFormulaWrapper,
	#instVars : [
		'exceptionClass',
		'exceptionBlock'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaExceptionWrapper >> exceptionBlock [

	^ exceptionBlock
		ifNil: [ exceptionBlock := '[ : ex | ex load ]' ]
]

{ #category : #private }
PackageFormulaExceptionWrapper >> exceptionClass [

	^ exceptionClass
		ifNil: [ exceptionClass := MCMergeOrLoadWarning ]
]

{ #category : #accessing }
PackageFormulaExceptionWrapper >> exceptionClass: anObject [

	exceptionClass := anObject
]

{ #category : #accessing }
PackageFormulaExceptionWrapper >> sourceCode: aString [ 

	exceptionBlock := aString
]

{ #category : #private }
PackageFormulaExceptionWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	self halt.
	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			cr;
			<< ' ] on: ';
			<< self exceptionClass asString;
			cr;
			<< 'do: ';
			<< self exceptionBlock storeString ].
]
