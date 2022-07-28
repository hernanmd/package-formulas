"
Command to open a web browser in the context receiver's selection.
"
Class {
	#name : #PFCtxOpenIssueCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFCtxOpenIssueCommand class >> defaultDescription [

	^ 'Open an issue'
]

{ #category : #initialization }
PFCtxOpenIssueCommand class >> defaultIconName [

	^ #comments
]

{ #category : #'accessing - defaults' }
PFCtxOpenIssueCommand class >> defaultName [

	^ 'Open Issue'
]

{ #category : #executing }
PFCtxOpenIssueCommand >> execute [

	"Parse the selected formula and open issues page"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	WebBrowser openOn: self selectedFormulaInfo webLinkIssues
]
