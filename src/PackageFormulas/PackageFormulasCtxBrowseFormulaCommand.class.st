"
Command to open a code browser on the selected formula, currently a method defining a Metacello install expression.

"
Class {
	#name : #PackageFormulasCtxBrowseFormulaCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseFormulaCommand class >> defaultDescription [

	^ 'Browse selected formula'
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseFormulaCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseFormulaCommand class >> defaultName [

	^ 'Browse Formula'
]

{ #category : #executing }
PackageFormulasCtxBrowseFormulaCommand >> execute [
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #formulaSelection) method.
	self stBrowser
		openOnClass: method methodClass
		selector: method selector.


]
