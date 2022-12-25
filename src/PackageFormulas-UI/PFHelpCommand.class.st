"
Implements the callback command for the Help button.
"
Class {
	#name : #PFHelpCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFHelpCommand class >> defaultDescription [

	^ 'Open a Help window'
]

{ #category : #initialization }
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
