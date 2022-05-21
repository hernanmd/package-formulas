"
The Browse command opens a Class Hierarchy Browser on the currently highlighted formula (not on the selected formulas to install). The user can visualize or modify the formula methods through this browser.

"
Class {
	#name : #PackageFormulasBrowseCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
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

	self halt.
	^ self selectedFormulas notEmpty
]

{ #category : #execution }
PackageFormulasBrowseCommand >> execute [
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #formulaSelection) method.
	Smalltalk tools browser
		openOnClass: method methodClass
		selector: method selector.


]
