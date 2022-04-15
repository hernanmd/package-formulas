Class {
	#name : #EnvironmentProfileSelectAllCommand,
	#superclass : #EnvironmentProfilesContextualMenuCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileSelectAllCommand class >> defaultDescription [

	^ 'Select all formulas'
]

{ #category : #initialization }
EnvironmentProfileSelectAllCommand class >> defaultIconName [

	^ #checkedBox
]

{ #category : #'accessing - defaults' }
EnvironmentProfileSelectAllCommand class >> defaultName [

	^ 'Select All'
]

{ #category : #execution }
EnvironmentProfileSelectAllCommand >> execute [
	"Select all uninstalled formula items"
	
	self formulasTableItems do: [ : fti | 
		| cbs |
		"Horrible way to get the table checkboxes..."
		cbs := self formulasTableColumns select: [ : c |
			(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
		cbs do: [ : cb | cb onActivation cull: fti ] ].
	self formulasTable refresh.

]
