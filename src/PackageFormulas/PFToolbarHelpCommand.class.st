Class {
	#name : #PFToolbarHelpCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFToolbarHelpCommand class >> defaultDescription [

	^ 'Open a Help window'
]

{ #category : #'accessing - defaults' }
PFToolbarHelpCommand class >> defaultIconName [

	^ #smallHelp
]

{ #category : #'accessing - defaults' }
PFToolbarHelpCommand class >> defaultName [

	^ 'Help'
]

{ #category : #execution }
PFToolbarHelpCommand >> execute [
	"Open a Help"

	PackageFormulasHelp open.

]
