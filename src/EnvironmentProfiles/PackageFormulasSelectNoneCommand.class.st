Class {
	#name : #PackageFormulasSelectNoneCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasSelectNoneCommand class >> defaultDescription [

	^ 'Unselect all formulas'
]

{ #category : #initialization }
PackageFormulasSelectNoneCommand class >> defaultIconName [

	^ #checkboxUnselected
]

{ #category : #'accessing - defaults' }
PackageFormulasSelectNoneCommand class >> defaultName [

	^ 'Select None'
]

{ #category : #execution }
PackageFormulasSelectNoneCommand >> execute [
	"Unselect all marked formula items"
	
	self formulasTableItems do: [ : fti | 
		| cbs |		
		"Horrible way to get the table checkboxes..."
		cbs := self formulasTableColumns select: [ : c |
			(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
		cbs do: [ : cb | cb onDeactivation cull: fti ] ].
	self formulasTable refresh.
]
