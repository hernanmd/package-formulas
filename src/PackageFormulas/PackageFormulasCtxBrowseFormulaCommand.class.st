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
	Smalltalk tools browser
		openOnClass: method methodClass
		selector: method selector.


]
