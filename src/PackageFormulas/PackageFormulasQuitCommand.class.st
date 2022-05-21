Class {
	#name : #PackageFormulasQuitCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasQuitCommand class >> defaultDescription [

	^ 'Quit'
]

{ #category : #initialization }
PackageFormulasQuitCommand class >> defaultIconName [

	^ #smallQuit
]

{ #category : #'accessing - defaults' }
PackageFormulasQuitCommand class >> defaultName [

	^ 'Quit'
]

{ #category : #execution }
PackageFormulasQuitCommand >> execute [
	"Close all the application's UI windows"

	self application close

]
