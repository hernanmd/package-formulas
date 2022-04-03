Class {
	#name : #EnvironmentProfileBrowseCommand,
	#superclass : #EnvironmentProfileCommand,
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileBrowseCommand class >> defaultDescription [

	^ 'Browse selected formulas'
]

{ #category : #'accessing - defaults' }
EnvironmentProfileBrowseCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
EnvironmentProfileBrowseCommand class >> defaultName [

	^ 'Browse'
]

{ #category : #testing }
EnvironmentProfileBrowseCommand >> canBeExecuted [ 

	^ self selectedFormulas notEmpty
]

{ #category : #execution }
EnvironmentProfileBrowseCommand >> execute [
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #selection) method.
	Smalltalk tools browser
		openOnClass: method methodClass
		selector: method selector.


]
