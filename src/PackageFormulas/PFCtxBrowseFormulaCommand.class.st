"
Command to open a code browser on the selected formula, currently a method defining a Metacello install expression.

"
Class {
	#name : #PFCtxBrowseFormulaCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFCtxBrowseFormulaCommand class >> defaultDescription [

	^ 'Browse selected formula'
]

{ #category : #'accessing - defaults' }
PFCtxBrowseFormulaCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PFCtxBrowseFormulaCommand class >> defaultName [

	^ 'Browse Formula'
]

{ #category : #executing }
PFCtxBrowseFormulaCommand >> execute [

	"Private - Inspect the selected pragma"

	| method |
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := self selectedFormulaMethod.
	self stBrowser
		openOnClass: method methodClass
		selector: method selector
]
