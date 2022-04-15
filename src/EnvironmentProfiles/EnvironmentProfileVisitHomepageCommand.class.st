Class {
	#name : #EnvironmentProfileVisitHomepageCommand,
	#superclass : #EnvironmentProfilesContextualMenuCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileVisitHomepageCommand class >> defaultDescription [

	^ 'Open homepage'
]

{ #category : #initialization }
EnvironmentProfileVisitHomepageCommand class >> defaultIconName [

	^ #home
]

{ #category : #'accessing - defaults' }
EnvironmentProfileVisitHomepageCommand class >> defaultName [

	^ 'Visit Homepage'
]

{ #category : #executing }
EnvironmentProfileVisitHomepageCommand >> execute [
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	WebBrowser openOn: (self application propertyAt: #selection) webLinkHome.

]
