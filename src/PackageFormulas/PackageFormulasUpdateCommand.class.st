Class {
	#name : #PackageFormulasUpdateCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasUpdateCommand class >> defaultDescription [

	^ 'Update application and formulas'
]

{ #category : #'accessing - defaults' }
PackageFormulasUpdateCommand class >> defaultIconName [

	^ #smallUpdate
]

{ #category : #'accessing - defaults' }
PackageFormulasUpdateCommand class >> defaultName [

	^ 'Update'
]

{ #category : #execution }
PackageFormulasUpdateCommand >> execute [
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
