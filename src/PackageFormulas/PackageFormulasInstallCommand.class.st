"
This command installs the selected formulas in the current image. If there are no selections, the command is not executed.
"
Class {
	#name : #PackageFormulasInstallCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #'accessing - defaults' }
PackageFormulasInstallCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : #'accessing - defaults' }
PackageFormulasInstallCommand class >> defaultName [

	^ 'Install'
]

{ #category : #testing }
PackageFormulasInstallCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #executing }
PackageFormulasInstallCommand >> execute [
	"Install all selected formulas in the receiver"

	self selectedFormulas 
		do: [ : formula | formula install ]
		displayingProgress: [ : formula | 'Installing ' , formula asString ].
	self inform: 'Done'
]
