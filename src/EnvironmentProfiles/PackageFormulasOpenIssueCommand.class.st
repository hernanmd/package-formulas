Class {
	#name : #PackageFormulasOpenIssueCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'EnvironmentProfiles-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasOpenIssueCommand class >> defaultDescription [

	^ 'Open an issue'
]

{ #category : #initialization }
PackageFormulasOpenIssueCommand class >> defaultIconName [

	^ #comments
]

{ #category : #'accessing - defaults' }
PackageFormulasOpenIssueCommand class >> defaultName [

	^ 'Open Issue'
]

{ #category : #execution }
PackageFormulasOpenIssueCommand >> execute [
	"Parse the selected formula and open issues page"
	
	self application propertyAt: #selection ifAbsent: [ ^ self ].
	WebBrowser openOn: (self application propertyAt: #selection) webLinkIssues.
]
