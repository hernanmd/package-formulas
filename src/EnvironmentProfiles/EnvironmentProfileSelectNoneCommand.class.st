Class {
	#name : #EnvironmentProfileSelectNoneCommand,
	#superclass : #EnvironmentProfilesContextualMenuCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileSelectNoneCommand class >> defaultDescription [

	^ 'Unselect all formulas'
]

{ #category : #initialization }
EnvironmentProfileSelectNoneCommand class >> defaultIconName [

	^ #checkboxUnselected
]

{ #category : #'accessing - defaults' }
EnvironmentProfileSelectNoneCommand class >> defaultName [

	^ 'Select None'
]

{ #category : #execution }
EnvironmentProfileSelectNoneCommand >> execute [
	"Unselect all marked formula items"
	
	self formulasTableItems do: [ : fti | 
		| cbs |		
		"Horrible way to get the table checkboxes..."
		cbs := self formulasTableColumns select: [ : c |
			(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
		cbs do: [ : cb | cb onDeactivation cull: fti ] ].
	self formulasTable refresh.
]
