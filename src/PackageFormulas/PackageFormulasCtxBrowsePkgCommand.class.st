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
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #formulaSelection) method.
	self shouldBeImplemented.
	Smalltalk tools browser
		openOnClass: method methodClass
		selector: method selector.


]
