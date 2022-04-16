Class {
	#name : #PackageFormulasBrowseCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasBrowseCommand class >> defaultDescription [

	^ 'Browse selected formulas'
]

{ #category : #'accessing - defaults' }
PackageFormulasBrowseCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PackageFormulasBrowseCommand class >> defaultName [

	^ 'Browse'
]

{ #category : #testing }
PackageFormulasBrowseCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
PackageFormulasBrowseCommand >> execute [
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #selection) method.
	Smalltalk tools browser
		openOnClass: method methodClass
		selector: method selector.


]
