Class {
	#name : #PackageFormulasTestCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasTestCommand class >> defaultDescription [

	^ 'Test installation of selected formulas'
]

{ #category : #'accessing - defaults' }
PackageFormulasTestCommand class >> defaultIconName [

	^ #testGreen
]

{ #category : #'accessing - defaults' }
PackageFormulasTestCommand class >> defaultName [

	^ 'Test'
]

{ #category : #execution }
PackageFormulasTestCommand >> execute [
	"Test installation of selected formulas"

	self selectedFormulas do: [ : formula | formula recordFormula ]
]
