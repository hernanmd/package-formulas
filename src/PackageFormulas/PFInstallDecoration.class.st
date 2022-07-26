"
This decoration just provides subbclasses sourceCode state `String`. See subclasses for specific functionality using source code.
"
Class {
	#name : #PFInstallDecoration,
	#superclass : #PFInstallationComponent,
	#instVars : [
		'sourceCode'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PFInstallDecoration >> sourceCode [

	^ sourceCode
]

{ #category : #accessing }
PFInstallDecoration >> sourceCode: anObject [

	sourceCode := anObject
]
