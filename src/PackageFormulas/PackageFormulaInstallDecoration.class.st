Class {
	#name : #PackageFormulaInstallDecoration,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaInstallDecoration >> basicInstallExpression: aClass selector: aSelector [
	"Answer a <String> representing a package installation expression as originally provided by a package author"
	
	^ (aClass class >> aSelector) ast body sourceCode
]

{ #category : #'accessing - deco' }
PackageFormulaInstallDecoration >> build [

	self next build
]

{ #category : #'accessing - deco' }
PackageFormulaInstallDecoration >> decoratedComponent [
	"Answer the Component decorated by this Decoration."
	
	^ self next decoratedComponent
]

{ #category : #'public access' }
PackageFormulaInstallDecoration >> evaluate: aFormulaExpression [
	"Private - Evaluate Smalltalk code in aFormulaExpression"

	Smalltalk compiler evaluate: aFormulaExpression.
]

{ #category : #initialization }
PackageFormulaInstallDecoration >> initialize [
	super initialize.
	next := ValueHolder new
]

{ #category : #private }
PackageFormulaInstallDecoration >> installIn: anAST [
	"Install the receiver's annotation into anAST"

	anAST link: self newLink.


]

{ #category : #'accessing - deco' }
PackageFormulaInstallDecoration >> next [
	"Answer the next decoration or component."

	^ next contents
]

{ #category : #'accessing - deco' }
PackageFormulaInstallDecoration >> setNext: aDecoration [
	next contents: aDecoration
]
