Class {
	#name : #PackageFormulasContextualMenuCommand,
	#superclass : #CmCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> application [

	^ self context application
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> formulasTableColumns [

	^ 	self formulasTable columns
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]
