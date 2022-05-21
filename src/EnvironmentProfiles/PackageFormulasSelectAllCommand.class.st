Class {
	#name : #PackageFormulasSelectAllCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasSelectAllCommand class >> defaultDescription [

	^ 'Select all formulas'
]

{ #category : #initialization }
PackageFormulasSelectAllCommand class >> defaultIconName [

	^ #checkedBox
]

{ #category : #'accessing - defaults' }
PackageFormulasSelectAllCommand class >> defaultName [

	^ 'Select All'
]

{ #category : #execution }
PackageFormulasSelectAllCommand >> execute [
	"Select all uninstalled formula items"
	
	self formulasTableItems do: [ : fti | 
		| cbs |
		"Horrible way to get the table checkboxes..."
		cbs := self formulasTableColumns select: [ : c |
			(c isKindOf: SpCheckBoxTableColumn) and: [ c title isEmpty  ] ].
		cbs do: [ : cb | cb onActivation cull: fti ] ].
	self formulasTable refresh.

]
