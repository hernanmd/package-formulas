Class {
	#name : #PFCtxRemoveFormulaCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFCtxRemoveFormulaCommand class >> defaultDescription [

	^ 'Remove the selected formula'
]

{ #category : #initialization }
PFCtxRemoveFormulaCommand class >> defaultIconName [

	^ #smallDelete
]

{ #category : #default }
PFCtxRemoveFormulaCommand class >> defaultName [

	^ 'Remove Formula'
]

{ #category : #executing }
PFCtxRemoveFormulaCommand >> execute [
	"Parse the selected formula and open issues page"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	(self confirm: 'Are you sure to delete the Formula of: ' , self selectedFormula selector)
		ifTrue: [ self halt. self selectedFormulaMethod removeFromSystem ]

]
