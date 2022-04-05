Class {
	#name : #EnvironmentProfileQuitCommand,
	#superclass : #EnvironmentProfileToolbarCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileQuitCommand class >> defaultDescription [

	^ 'Quit'
]

{ #category : #initialization }
EnvironmentProfileQuitCommand class >> defaultIconName [

	^ #smallQuit
]

{ #category : #'accessing - defaults' }
EnvironmentProfileQuitCommand class >> defaultName [

	^ 'Quit'
]

{ #category : #execution }
EnvironmentProfileQuitCommand >> execute [
	"Close all the application's UI windows"

	self application close

]
