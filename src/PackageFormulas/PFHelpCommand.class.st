Class {
	#name : #PFHelpCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFHelpCommand class >> defaultDescription [

	^ 'Open a Help window'
]

{ #category : #'accessing - defaults' }
PFHelpCommand class >> defaultIconName [

	^ #smallHelp
]

{ #category : #'accessing - defaults' }
PFHelpCommand class >> defaultName [

	^ 'Help'
]

{ #category : #execution }
PFHelpCommand >> execute [
	"Open a Help"

	PackageFormulasHelp open.

]
