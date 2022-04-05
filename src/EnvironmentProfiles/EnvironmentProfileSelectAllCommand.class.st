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
	"Parse the selected formula and open issues page"
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	
]
