Class {
	#name : #EnvironmentProfileOpenIssueCommand,
	#superclass : #EnvironmentProfilesContextualMenuCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #'accessing - defaults' }
EnvironmentProfileOpenIssueCommand class >> defaultDescription [

	^ 'Open an issue'
]

{ #category : #initialization }
EnvironmentProfileOpenIssueCommand class >> defaultIconName [

	^ #comments
]

{ #category : #'accessing - defaults' }
EnvironmentProfileOpenIssueCommand class >> defaultName [

	^ 'Open Issue'
]
