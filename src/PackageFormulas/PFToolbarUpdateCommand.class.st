Class {
	#name : #PFToolbarUpdateCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFToolbarUpdateCommand class >> defaultDescription [

	^ 'Update application and formulas'
]

{ #category : #'accessing - defaults' }
PFToolbarUpdateCommand class >> defaultIconName [

	^ #smallUpdate
]

{ #category : #'accessing - defaults' }
PFToolbarUpdateCommand class >> defaultName [

	^ 'Update'
]

{ #category : #execution }
PFToolbarUpdateCommand >> execute [
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
