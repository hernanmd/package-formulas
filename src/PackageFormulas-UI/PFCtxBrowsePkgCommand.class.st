"
Command to open a code browser on the receiver's context (selected formula package).
"
Class {
	#name : #PFCtxBrowsePkgCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFCtxBrowsePkgCommand class >> defaultDescription [

	^ 'Browse selected formula''s source code'
]

{ #category : #initialization }
PFCtxBrowsePkgCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #default }
PFCtxBrowsePkgCommand class >> defaultName [

	^ 'Browse Source Code'
]

{ #category : #testing }
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
