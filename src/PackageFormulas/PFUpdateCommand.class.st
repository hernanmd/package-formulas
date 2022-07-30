Class {
	#name : #PFUpdateCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFUpdateCommand class >> defaultDescription [

	^ 'Update application and formulas'
]

{ #category : #'accessing - defaults' }
PFUpdateCommand class >> defaultIconName [

	^ #smallUpdate
]

{ #category : #'accessing - defaults' }
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
		openModalWithSpec.
	answer ifFalse: [ ^ self ].
	PackageFormulasApp updateApp.
	self inform: 'Done'
]
