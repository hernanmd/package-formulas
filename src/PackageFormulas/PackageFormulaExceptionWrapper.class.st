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

{ #category : #private }
PackageFormulaExceptionWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			cr;
			<< ' ] on: ';
			<< self exceptionClass;
			cr;
			<< 'do: ';
			<< self exceptionBlock ].
]
