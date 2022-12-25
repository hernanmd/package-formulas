"
Command to update the application packages. As formulas are contained in methods, it also triggers an update of package formulas.
"
Class {
	#name : #PFUpdateCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFUpdateCommand class >> defaultDescription [

	^ 'Update application and formulas'
]

{ #category : #initialization }
PFUpdateCommand class >> defaultIconName [

	^ #smallUpdate
]

{ #category : #default }
PFUpdateCommand class >> defaultName [

	^ 'Update'
]

{ #category : #executing }
PFUpdateCommand >> execute [
	"Try to update the application"

	| answer |
	answer := (SpConfirmDialog newApplication: self application)
		label: 'Do you want to update PackageFormulas?';
		acceptLabel: 'Confirm';
		cancelLabel: 'Cancel';
		title: 'PackageFormulas confirmation request';
		openModal.
	answer ifFalse: [ ^ self ].
	PackageFormulasApp updateApp.
	self inform: 'Done'
]
