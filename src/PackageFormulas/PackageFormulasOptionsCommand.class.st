Class {
	#name : #PackageFormulasOptionsCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasOptionsCommand class >> defaultDescription [

	^ 'Set formulas options'
]

{ #category : #initialization }
PackageFormulasOptionsCommand class >> defaultIconName [

	^ #configuration
]

{ #category : #'accessing - defaults' }
PackageFormulasOptionsCommand class >> defaultName [

	^ 'Options'
]

{ #category : #execution }
PackageFormulasOptionsCommand >> execute [
	"Close all the application's UI windows"

	self application close

]
