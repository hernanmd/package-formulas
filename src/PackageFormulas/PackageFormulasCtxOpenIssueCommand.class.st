"
Command to open a web browser in the context receiver's selection.
"
Class {
	#name : #PackageFormulasCtxOpenIssueCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxOpenIssueCommand class >> defaultDescription [

	^ 'Open an issue'
]

{ #category : #initialization }
PackageFormulasCtxOpenIssueCommand class >> defaultIconName [

	^ #comments
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxOpenIssueCommand class >> defaultName [

	^ 'Open Issue'
]

{ #category : #execution }
PackageFormulasCtxOpenIssueCommand >> execute [
	"Parse the selected formula and open issues page"
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	WebBrowser openOn: (self application propertyAt: #formulaSelection) webLinkIssues.
]
