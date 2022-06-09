"
Command to select all the displayed formulas in the receiver's context.
"
Class {
	#name : #PackageFormulasCtxSelectAllCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxSelectAllCommand class >> defaultDescription [

	^ 'Select all formulas'
]

{ #category : #initialization }
PackageFormulasCtxSelectAllCommand class >> defaultIconName [

	^ #checkedBox
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxSelectAllCommand class >> defaultName [

	^ 'Select All'
]

{ #category : #execution }
PackageFormulasCtxSelectAllCommand >> execute [
	"Select all uninstalled formula items"
	
	self formulasTableItems do: [ : fti | 
		| cbs |
		"Horrible way to get the table checkboxes..."
		cbs := self formulasTableColumns select: [ : c |
			(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
		cbs do: [ : cb | cb onActivation cull: fti ] ].
	self formulasTable refresh.

]
