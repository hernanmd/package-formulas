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
