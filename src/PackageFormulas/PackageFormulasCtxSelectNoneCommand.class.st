Class {
	#name : #PackageFormulasCtxSelectNoneCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxSelectNoneCommand class >> defaultDescription [

	^ 'Unselect all formulas'
]

{ #category : #initialization }
PackageFormulasCtxSelectNoneCommand class >> defaultIconName [

	^ #checkboxUnselected
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxSelectNoneCommand class >> defaultName [

	^ 'Select None'
]

{ #category : #execution }
PackageFormulasCtxSelectNoneCommand >> execute [
	"Unselect all marked formula items"
	
	self formulasTableItems do: [ : fti | 
		| cbs |		
		"Horrible way to get the table checkboxes..."
		cbs := self formulasTableColumns select: [ : c |
			(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
		cbs do: [ : cb | cb onDeactivation cull: fti ] ].
	self formulasTable refresh.
]
