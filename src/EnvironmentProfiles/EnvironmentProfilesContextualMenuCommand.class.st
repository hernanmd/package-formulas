Class {
	#name : #EnvironmentProfilesContextualMenuCommand,
	#superclass : #CmCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #accessing }
EnvironmentProfilesContextualMenuCommand >> application [

	^ self context application
]

{ #category : #accessing }
EnvironmentProfilesContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
EnvironmentProfilesContextualMenuCommand >> formulasTableColumns [

	^ 	self formulasTable columns
]

{ #category : #accessing }
EnvironmentProfilesContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]
