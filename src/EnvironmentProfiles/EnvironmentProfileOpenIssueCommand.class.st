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

{ #category : #execution }
EnvironmentProfileOpenIssueCommand >> execute [
	"Parse the selected formula and open issues page"
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	WebBrowser openOn: (self application propertyAt: #selection) webLinkIssues.
]
