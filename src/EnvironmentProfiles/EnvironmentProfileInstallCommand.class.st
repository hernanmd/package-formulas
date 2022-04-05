Class {
	#name : #EnvironmentProfileInstallCommand,
	#superclass : #EnvironmentProfileToolbarCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileInstallCommand class >> defaultIconName [

	^ #glamorousGo
]

{ #category : #'accessing - defaults' }
EnvironmentProfileInstallCommand class >> defaultName [

	^ 'Install'
]

{ #category : #execution }
EnvironmentProfileInstallCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
EnvironmentProfileInstallCommand >> execute [
	"Install all selected formulas in the receiver"

	self selectedFormulas do: [ : pragma | pragma installFormula ]

]
