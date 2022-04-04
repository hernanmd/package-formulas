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
