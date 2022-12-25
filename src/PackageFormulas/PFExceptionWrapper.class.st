"
Allows you to customize an exception handler by supplying the class of the `Exception` and the block to be executed.
"
Class {
	#name : #PFExceptionWrapper,
	#superclass : #PFWrapInstallDecoration,
	#instVars : [
		'exceptionClass',
		'exceptionBlock'
	],
	#category : #'PackageFormulas-Decorator'
}

{ #category : #private }
PFExceptionWrapper >> defaultInstallExceptionClass [

	^ Smalltalk globals 
		at: #MCMergeOrLoadWarning
		ifPresent: [ : class | class ]
		ifAbsent: [ self error ]


]

{ #category : #private }
PFExceptionWrapper >> exceptionBlock [

	^ exceptionBlock
		ifNil: [ exceptionBlock := '[ : ex | ex load ]' ]
]

{ #category : #private }
PFExceptionWrapper >> exceptionClass [

	^ exceptionClass
		ifNil: [ exceptionClass := self defaultInstallExceptionClass ]
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
			  << self exceptionClass asString;
			  nextPut: Character cr;
			  << 'do: ';
			  << self exceptionBlock ]
]

{ #category : #accessing }
PFExceptionWrapper >> sourceCode: aString [ 

	exceptionBlock := aString
]
