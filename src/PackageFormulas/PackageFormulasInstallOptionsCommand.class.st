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

{ #category : #'as yet unclassified' }
PackageFormulasInstallOptionsCommand >> installFromScripter: aScripterUI [

	self halt.
	aScripterUI formula install
]

{ #category : #execution }
PackageFormulasInstallOptionsCommand >> openInstallOptions [

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
