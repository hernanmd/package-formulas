"
The Browse command opens a Class Hierarchy Browser on the currently highlighted formula (not on the selected formulas to install). The user can visualize or modify the formula methods through this browser.

"
Class {
	#name : #PackageFormulasViewInstalledCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasViewInstalledCommand class >> defaultDescription [

	^ 'View installed packages'
]

{ #category : #'accessing - defaults' }
PackageFormulasViewInstalledCommand class >> defaultIconName [

	^ #packageColored
]

{ #category : #'accessing - defaults' }
PackageFormulasViewInstalledCommand class >> defaultName [

	^ 'View installed'
]

{ #category : #testing }
PackageFormulasViewInstalledCommand >> canBeExecuted [ 
	"Answer <true> if the receiver's application includes any of its defined formulas already installed"

	^ self context hasFormulasInstalled
]

{ #category : #execution }
PackageFormulasViewInstalledCommand >> execute [
	"Private - Inspect the selected formula"

	self canBeExecuted ifFalse: [ ^ self inform: 'No installed formulas in this image' ].
	self context 
		formulasItems: self application installedFormulas;
		cleanCategoriesPresenterSelection.
]
