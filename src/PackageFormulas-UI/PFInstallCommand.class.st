"
This command installs the selected formulas in the current image. If there are no selections, the command is not executed.
"
Class {
	#name : #PFInstallCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #initialization }
PFInstallCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : #default }
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
		do: [ : formula | 
			formula installIn: self application.
			self context unselectFormula: formula. ]
		displayingProgress: [ : formula | 'Installing ' , formula selector ].
	self inform: 'Done'
]
