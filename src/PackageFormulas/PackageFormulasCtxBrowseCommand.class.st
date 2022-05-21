Class {
	#name : #PackageFormulasCtxBrowseCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseCommand class >> defaultDescription [

	^ 'Browse selected formula'
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseCommand class >> defaultName [

	^ 'Browse'
]

{ #category : #executing }
PackageFormulasCtxBrowseCommand >> execute [
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #formulaSelection) method.
	Smalltalk tools browser
		openOnClass: method methodClass
		selector: method selector.


]
