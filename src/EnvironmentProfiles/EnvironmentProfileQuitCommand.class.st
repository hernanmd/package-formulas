Class {
	#name : #EnvironmentProfileQuitCommand,
	#superclass : #EnvironmentProfileCommand,
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
	"Quit applicationr"

	self application close

]
