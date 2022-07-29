"
The Browse command opens a Class Hierarchy Browser on the currently highlighted formula (not on the selected formulas to install). The user can visualize or modify the formula methods through this browser.

"
Class {
	#name : #PFViewInstalledCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFViewInstalledCommand class >> defaultDescription [

	^ 'View installed packages'
]

{ #category : #'accessing - defaults' }
PFViewInstalledCommand class >> defaultIconName [

	^ #packageColored
]

{ #category : #'accessing - defaults' }
PFViewInstalledCommand class >> defaultName [

	^ 'View installed'
]

{ #category : #testing }
PFViewInstalledCommand >> canBeExecuted [ 
	"Answer <true> if the receiver's application includes any of its defined formulas already installed"

	^ self context hasFormulasInstalled
]

{ #category : #execution }
PFViewInstalledCommand >> execute [
	"Private - Inspect the selected formula"

	self canBeExecuted ifFalse: [ ^ self inform: 'No installed formulas in this image' ].
	self context 
		formulasItems: self application installedFormulas;
		cleanCategoriesPresenterSelection.
]