Class {
	#name : #PackageFormulasInstallCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #'accessing - defaults' }
PackageFormulasInstallCommand class >> defaultIconName [

	^ #glamorousGo
]

{ #category : #'accessing - defaults' }
PackageFormulasInstallCommand class >> defaultName [

	^ 'Install'
]

{ #category : #testing }
PackageFormulasInstallCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
PackageFormulasInstallCommand >> execute [
	"Install all selected formulas in the receiver"

	self selectedFormulas 
		do: [ : formula | formula install ]
		displayingProgress: [ : formula | 'Installing ' , formula ].
	self inform: 'Done'
]
