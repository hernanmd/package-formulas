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
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	WebBrowser openOn: (self application propertyAt: #selection) webLinkHome.

]
