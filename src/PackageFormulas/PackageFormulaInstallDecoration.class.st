Class {
	#name : #PackageFormulaInstallDecoration,
	#superclass : #Object,
	#instVars : [
		'next',
		'name'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #'instance creation' }
PackageFormulaInstallDecoration class >> named: aString [
	"Answer a new decoration named aString"

	^ self new
		name: aString;
		yourself
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
	"Install the receiver's annotation into anAST. Answer the new <MetaLink>"

	| metaLink |
	metaLink := self newFormulaLink.
	anAST link: metaLink.
	^ metaLink


]

{ #category : #accessing }
PackageFormulaInstallDecoration >> name [

	^ name
]

{ #category : #accessing }
PackageFormulaInstallDecoration >> name: anObject [

	name := anObject
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
