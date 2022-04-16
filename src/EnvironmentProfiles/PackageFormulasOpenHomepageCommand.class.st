Class {
	#name : #PackageFormulasOpenHomepageCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasOpenHomepageCommand class >> defaultDescription [

	^ 'Open homepage'
]

{ #category : #initialization }
PackageFormulasOpenHomepageCommand class >> defaultIconName [

	^ #home
]

{ #category : #'accessing - defaults' }
PackageFormulasOpenHomepageCommand class >> defaultName [

	^ 'Visit Homepage'
]

{ #category : #executing }
PackageFormulasOpenHomepageCommand >> execute [
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	WebBrowser openOn: (self application propertyAt: #selection) webLinkHome.

]
