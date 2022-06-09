Class {
	#name : #PackageFormulasHelpCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasHelpCommand class >> defaultDescription [

	^ 'Open a Help window'
]

{ #category : #'accessing - defaults' }
PackageFormulasHelpCommand class >> defaultIconName [

	^ #smallHelp
]

{ #category : #'accessing - defaults' }
PackageFormulasHelpCommand class >> defaultName [

	^ 'Help'
]

{ #category : #execution }
PackageFormulasHelpCommand >> execute [
	"Open a Help"

	PackageFormulasHelp open.

]
