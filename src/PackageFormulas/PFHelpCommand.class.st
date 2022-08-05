"
Implements the callback command for the Help button.
"
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

{ #category : #default }
PFHelpCommand class >> defaultName [

	^ 'Help'
]

{ #category : #executing }
PFHelpCommand >> execute [
	"Open a Help"

	PackageFormulasHelp open.

]
