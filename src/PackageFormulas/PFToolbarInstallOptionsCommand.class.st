Class {
	#name : #PFToolbarInstallOptionsCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFToolbarInstallOptionsCommand class >> defaultDescription [

	^ 'Set formulas options'
]

{ #category : #initialization }
PFToolbarInstallOptionsCommand class >> defaultIconName [

	^ #configuration
]

{ #category : #'accessing - defaults' }
PFToolbarInstallOptionsCommand class >> defaultName [

	^ 'Install Options'
]

{ #category : #testing }
PFToolbarInstallOptionsCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
PFToolbarInstallOptionsCommand >> execute [
	"Test installation of selected formulas"

	self canBeExecuted 
		ifTrue: [ ^ self openInstallOptions ]
		ifFalse: [ self inform: 'No formulas selected.' ]
]

{ #category : #execution }
PFToolbarInstallOptionsCommand >> installFromScripter: aScripterUI [

	self halt.
	aScripterUI formula install
]

{ #category : #execution }
PFToolbarInstallOptionsCommand >> openInstallOptions [

	| answer |
	
	answer := PackageFormulasScripterUI basicNew
		newUserFormulaFrom: self context selectedFormulas;	
		initialize;
		openModalWithSpec.
	answer
		ifNotNil: [ : presenter | 
			presenter isCancelled 
				ifFalse: [ self installFromScripter: answer presenter ] ].
	^ answer
]
