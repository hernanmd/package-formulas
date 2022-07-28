Class {
	#name : #PFInstallOptionsCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFInstallOptionsCommand class >> defaultDescription [

	^ 'Set formulas options'
]

{ #category : #initialization }
PFInstallOptionsCommand class >> defaultIconName [

	^ #configuration
]

{ #category : #'accessing - defaults' }
PFInstallOptionsCommand class >> defaultName [

	^ 'Install Options'
]

{ #category : #testing }
PFInstallOptionsCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #executing }
PFInstallOptionsCommand >> execute [
	"Test installation of selected formulas"

	self canBeExecuted 
		ifTrue: [ ^ self openInstallOptions ]
		ifFalse: [ self inform: 'No formulas selected.' ]
]

{ #category : #'as yet unclassified' }
PFInstallOptionsCommand >> installFromScripter: aScripterUI [

	self halt.
	aScripterUI formula install
]

{ #category : #execution }
PFInstallOptionsCommand >> openInstallOptions [
	"Open a <PackageFormulasScripterUI> as a modal dialog, to prevent multiple conflicting installations"
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
