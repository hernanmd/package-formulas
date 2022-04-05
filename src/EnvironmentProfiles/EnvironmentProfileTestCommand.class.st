Class {
	#name : #EnvironmentProfileTestCommand,
	#superclass : #EnvironmentProfileToolbarCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileTestCommand class >> defaultDescription [

	^ 'Test installation of selected formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileTestCommand class >> defaultIconName [

	^ #testGreen
]

{ #category : #'accessing - defaults' }
EnvironmentProfileTestCommand class >> defaultName [

	^ 'Test'
]

{ #category : #execution }
EnvironmentProfileTestCommand >> execute [
	"Try to update the Environment Profiles application"

	EnvironmentProfileApp updateApp.

]
