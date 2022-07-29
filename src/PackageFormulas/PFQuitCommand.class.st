Class {
	#name : #PFQuitCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFQuitCommand class >> defaultDescription [

	^ 'Quit'
]

{ #category : #initialization }
PFQuitCommand class >> defaultIconName [

	^ #smallQuit
]

{ #category : #'accessing - defaults' }
PFQuitCommand class >> defaultName [

	^ 'Quit'
]

{ #category : #execution }
PFQuitCommand >> execute [
	"Close all the application's UI windows"

	self application close

]