Class {
	#name : #PackageFormulasUpdateCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'EnvironmentProfiles-Commands'
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
	"Try to update the Environment Profiles application"

	PackageFormulasApp updateApp.
	self inform: 'Done'
]
