"
Command to select all the displayed formulas in the receiver's context.
"
Class {
	#name : #PFCtxSelectAllCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFCtxSelectAllCommand class >> defaultDescription [

	^ 'Select all formulas'
]

{ #category : #initialization }
PFCtxSelectAllCommand class >> defaultIconName [

	^ #checkedBox
]

{ #category : #'accessing - defaults' }
PFCtxSelectAllCommand class >> defaultName [

	^ 'Select All'
]

{ #category : #executing }
PFCtxSelectAllCommand >> execute [
	"Select all uninstalled formula items"
	
	self formulasTableItems 
		do: [ : fti | 
			| cbs |
			"Horrible way to get the table checkboxes..."
			cbs := self formulasTableColumns select: [ : c |
				(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
			cbs do: [ : cb | cb onActivation cull: fti ] ]
		displayingProgress: [ : formula | 'Selecting ' , formula selector ]..
	self formulasTable refresh.

]
