"
A command to open a UI with install option for the currently selected formulas.
"
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

{ #category : #'public access' }
PFInstallOptionsCommand >> evaluate: aFormulaExpression [
	"Private - Evaluate Smalltalk code in aFormulaExpression"

	Smalltalk compiler evaluate: aFormulaExpression.
]

{ #category : #executing }
PFInstallOptionsCommand >> execute [
	"Test installation of selected formulas"

	self canBeExecuted 
		ifTrue: [ ^ self openInstallOptions ]
		ifFalse: [ self inform: 'No formulas selected.' ]
]

{ #category : #executing }
PFInstallOptionsCommand >> installFromScripter: aScripterUI [
	"Install the receiver's formula in the context of the current application"

	self evaluate: aScripterUI installationExpression
]

{ #category : #executing }
PFInstallOptionsCommand >> openInstallOptions [
	"Open a <PackageFormulasScripterUI> as a modal dialog, to prevent multiple conflicting installations"
	| answer |
	
	answer := PackageFormulasScripterUI basicNew
		newUserFormulaFrom: self context selectedFormulas;	
		initialize;
		openModal.
	answer
		ifNotNil: [ : presenter | 
			presenter isCancelled 
				ifFalse: [ self installFromScripter: answer presenter ] ].
	^ answer
]
