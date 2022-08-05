Class {
	#name : #PFViewToInstallCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFViewToInstallCommand class >> defaultDescription [

	^ 'View formulas to install'
]

{ #category : #'accessing - defaults' }
PFViewToInstallCommand class >> defaultIconName [

	^ #packageAdd
]

{ #category : #default }
PFViewToInstallCommand class >> defaultName [

	^ 'To install'
]

{ #category : #testing }
PFViewToInstallCommand >> canBeExecuted [ 
	"Answer <true> if the receiver's application includes any of its defined formulas already installed"

	^ self application selectedFormulas notEmpty
]

{ #category : #executing }
PFViewToInstallCommand >> execute [
	"Private - Inspect the selected formula"

	self canBeExecuted ifFalse: [ self inform: 'No formulas selected to install.' ].
	self context 
		formulasItems: self application selectedFormulas;
		unselectCategories.
]
