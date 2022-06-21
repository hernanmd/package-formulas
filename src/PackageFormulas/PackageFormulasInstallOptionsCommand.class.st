Class {
	#name : #PackageFormulasInstallOptionsCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasInstallOptionsCommand class >> defaultDescription [

	^ 'Set formulas options'
]

{ #category : #initialization }
PackageFormulasInstallOptionsCommand class >> defaultIconName [

	^ #configuration
]

{ #category : #'accessing - defaults' }
PackageFormulasInstallOptionsCommand class >> defaultName [

	^ 'Install Options'
]

{ #category : #testing }
PackageFormulasInstallOptionsCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
PackageFormulasInstallOptionsCommand >> execute [
	"Test installation of selected formulas"

	self canBeExecuted 
		ifTrue: [ ^ self openInstallOptions ]
		ifFalse: [ self inform: 'No formulas selected.' ]
]

{ #category : #execution }
PackageFormulasInstallOptionsCommand >> openInstallOptions [

	| answer |
	
	answer := PackageFormulasScripterUI new openModalWithSpec.
	answer
		ifNotNil: [ : presenter | 
			presenter isCancelled 
				ifFalse: [ self application install ] ].
	^ answer
]
