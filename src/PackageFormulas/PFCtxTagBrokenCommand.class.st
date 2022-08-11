Class {
	#name : #PFCtxTagBrokenCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFCtxTagBrokenCommand class >> defaultDescription [

	^ 'Mark as broken'
]

{ #category : #initialization }
PFCtxTagBrokenCommand class >> defaultIconName [

	^ #error
]

{ #category : #'accessing - defaults' }
PFCtxTagBrokenCommand class >> defaultName [

	^ 'Tag as broken'
]

{ #category : #executing }
PFCtxTagBrokenCommand >> execute [
	"Tag the selected formula as broken"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	WebBrowser openOn: self selectedFormulaInfo webLinkIssues
]