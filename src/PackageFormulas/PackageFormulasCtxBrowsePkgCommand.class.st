"
Command to open a code browser on the receiver's context (selected formula package).
"
Class {
	#name : #PackageFormulasCtxBrowsePkgCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowsePkgCommand class >> defaultDescription [

	^ 'Browse selected formula''s source code'
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowsePkgCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowsePkgCommand class >> defaultName [

	^ 'Browse Source Code'
]

{ #category : #executing }
PackageFormulasCtxBrowsePkgCommand >> canBeExecuted [ 

	^ (self application 
		propertyAt: #formulaSelection 
		ifAbsent: [ ^ false ]) isInstalled.
]

{ #category : #executing }
PackageFormulasCtxBrowsePkgCommand >> execute [
	"Private - Open a Smalltalk browser on the selected pragma"

	| method |
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #formulaSelection) method.
	self querier packageFormula: method.
	self stBrowser openOnPackage: self querier package

]
