Class {
	#name : #EnvironmentProfileInstallCommand,
	#superclass : #EnvironmentProfileCommand,
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileInstallCommand class >> defaultDescription [

	^ 'Install selected formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileInstallCommand class >> defaultIconName [

	^ #glamorousGo
]

{ #category : #'accessing - defaults' }
EnvironmentProfileInstallCommand class >> defaultName [

	^ 'Install'
]

{ #category : #execution }
EnvironmentProfileInstallCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
EnvironmentProfileInstallCommand >> execute [

	self halt.
	self selectedFormulas do: #install

]
