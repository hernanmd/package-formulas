"
This command installs the selected formulas in the current image. If there are no selections, the command is not executed.
"
Class {
	#name : #PFToolbarInstallCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFToolbarInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #'accessing - defaults' }
PFToolbarInstallCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : #'accessing - defaults' }
PFToolbarInstallCommand class >> defaultName [

	^ 'Install'
]

{ #category : #testing }
PFToolbarInstallCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #executing }
PFToolbarInstallCommand >> execute [
	"Install all selected formulas in the receiver"

	self selectedFormulas 
		do: [ : formula | formula install ]
		displayingProgress: [ : formula | 'Installing ' , formula asString ].
	self inform: 'Done'
]
