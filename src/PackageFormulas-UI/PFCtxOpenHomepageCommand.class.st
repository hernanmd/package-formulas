"
Command to open a web browser in the context of the selected item in the Application.
The page opened is the detected home page of the `PackageFormula`.

This command depends of `#'WebBrowser'`.


"
Class {
	#name : #PFCtxOpenHomepageCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFCtxOpenHomepageCommand class >> defaultDescription [

	^ 'Open homepage'
]

{ #category : #initialization }
PFCtxOpenHomepageCommand class >> defaultIconName [

	^ #home
]

{ #category : #default }
PFCtxOpenHomepageCommand class >> defaultName [

	^ 'Visit Homepage'
]

{ #category : #executing }
PFCtxOpenHomepageCommand >> execute [

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	self webBrowser openOn: self selectedFormulaInfo webLinkHome
]
