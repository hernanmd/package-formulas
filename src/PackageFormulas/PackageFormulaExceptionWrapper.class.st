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
PackageFormulaExceptionWrapper >> wrapInClass: aClass selector: aSelector [

	| formulaExpression |
	formulaExpression := String streamContents: [ : stream |
		stream
			<< '[ ';
			cr;
			<< 	(self basicInstallExpression: aClass selector: aSelector);
			cr;
			<< ' ] on: ';
			<< self exceptionClass;
			cr;
			<< 'do: ';
			<< self exceptionBlock ].
	self evaluate: formulaExpression
]
