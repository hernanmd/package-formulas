Class {
	#name : #EnvironmentProfileTestCommand,
	#superclass : #EnvironmentProfileToolbarCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileTestCommand class >> defaultDescription [

	^ 'Test installation of selected formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileTestCommand class >> defaultIconName [

	^ #testGreen
]

{ #category : #'accessing - defaults' }
EnvironmentProfileTestCommand class >> defaultName [

	^ 'Test'
]

{ #category : #execution }
EnvironmentProfileTestCommand >> execute [
	"Test installation of selected formulas"

	self selectedFormulas do: [ : formula | formula recordFormula ]
]
