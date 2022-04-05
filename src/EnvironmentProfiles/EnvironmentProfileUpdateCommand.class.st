Class {
	#name : #EnvironmentProfileUpdateCommand,
	#superclass : #EnvironmentProfileToolbarCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileUpdateCommand class >> defaultDescription [

	^ 'Update application and formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileUpdateCommand class >> defaultIconName [

	^ #smallUpdate
]

{ #category : #'accessing - defaults' }
EnvironmentProfileUpdateCommand class >> defaultName [

	^ 'Update'
]

{ #category : #execution }
EnvironmentProfileUpdateCommand >> execute [
	"Try to update the Environment Profiles application"

	EnvironmentProfileApp updateApp.

]
