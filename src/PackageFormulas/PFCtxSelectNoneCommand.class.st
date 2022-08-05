"
Command to unselect all the displayed formulas in the receiver's context.

"
Class {
	#name : #PFCtxSelectNoneCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFCtxSelectNoneCommand class >> defaultDescription [

	^ 'Unselect all formulas'
]

{ #category : #initialization }
PFCtxSelectNoneCommand class >> defaultIconName [

	^ #checkboxUnselected
]

{ #category : #'accessing - defaults' }
PFCtxSelectNoneCommand class >> defaultName [

	^ 'Select None'
]

{ #category : #execution }
PFCtxSelectNoneCommand >> execute [
	"Unselect all marked formula items"
	
	self formulasTableItems
		do: [ : fti | 
			| cbs |
			"Horrible way to get the table checkboxes..."
			cbs := self formulasTableColumns select: [ : c |
				(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
			cbs do: [ : cb | cb onDeactivation cull: fti ] ]
		displayingProgress: [ : formula | 'Unselecting ' , formula selector ].
	self formulasTable refresh.
]
