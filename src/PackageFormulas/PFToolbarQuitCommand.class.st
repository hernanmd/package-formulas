Class {
	#name : #PFToolbarQuitCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFToolbarQuitCommand class >> defaultDescription [

	^ 'Quit'
]

{ #category : #initialization }
PFToolbarQuitCommand class >> defaultIconName [

	^ #smallQuit
]

{ #category : #'accessing - defaults' }
PFToolbarQuitCommand class >> defaultName [

	^ 'Quit'
]

{ #category : #execution }
PFToolbarQuitCommand >> execute [
	"Close all the application's UI windows"

	self application close

]
