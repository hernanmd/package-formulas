"
Command to open a code browser on the receiver's context (selected formula package).
"
Class {
	#name : #PFCtxBrowsePkgCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFCtxBrowsePkgCommand class >> defaultDescription [

	^ 'Browse selected formula''s source code'
]

{ #category : #'accessing - defaults' }
PFCtxBrowsePkgCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PFCtxBrowsePkgCommand class >> defaultName [

	^ 'Browse Source Code'
]

{ #category : #executing }
PFCtxBrowsePkgCommand >> canBeExecuted [ 

	^ (self application 
		propertyAt: #formulaSelection 
		ifAbsent: [ ^ false ]) hasPackageInstalled.
]

{ #category : #executing }
PFCtxBrowsePkgCommand >> execute [
	"Private - Open a Smalltalk browser on the selected pragma"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	self querier packageFormula: self selectedFormulaMethod.
	self stBrowser openOnPackage: self querier package
]
