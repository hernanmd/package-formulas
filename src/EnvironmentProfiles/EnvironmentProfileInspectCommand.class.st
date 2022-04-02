Class {
	#name : #EnvironmentProfileInspectCommand,
	#superclass : #EnvironmentProfileCommand,
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileInspectCommand class >> defaultDescription [

	^ 'Inspect selected formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileInspectCommand class >> defaultIconName [

	^ #glamorousInspect
]

{ #category : #'accessing - defaults' }
EnvironmentProfileInspectCommand class >> defaultName [

	^ 'Inspect'
]

{ #category : #testing }
EnvironmentProfileInspectCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
EnvironmentProfileInspectCommand >> execute [
	"Private - Inspect the selected pragma"

	(self application propertyAt: #selection) method inspect.


]
