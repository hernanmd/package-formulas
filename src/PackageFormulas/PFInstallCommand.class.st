"
This command installs the selected formulas in the current image. If there are no selections, the command is not executed.
"
Class {
	#name : #PFInstallCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #'accessing - defaults' }
PFInstallCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : #'accessing - defaults' }
PFInstallCommand class >> defaultName [

	^ 'Install'
]

{ #category : #testing }
PFInstallCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #executing }
PFInstallCommand >> execute [
	"Install all selected formulas in the receiver"

	self selectedFormulas 
		do: [ : formula | formula install ]
		displayingProgress: [ : formula | 'Installing ' , formula asString ].
	self inform: 'Done'
]
