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
