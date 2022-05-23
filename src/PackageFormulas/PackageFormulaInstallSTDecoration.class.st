"
This decoration just provides subbclasses sourceCode state `String`. See subclasses for specific functionality using source code.
"
Class {
	#name : #PackageFormulaInstallSTDecoration,
	#superclass : #PackageFormulaInstallDecoration,
	#instVars : [
		'sourceCode'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PackageFormulaInstallSTDecoration >> sourceCode [

	^ sourceCode
]

{ #category : #accessing }
PackageFormulaInstallSTDecoration >> sourceCode: anObject [

	sourceCode := anObject
]
