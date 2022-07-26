"
Command to open a web browser in the context of the selected item in the Application.
The page opened is the detected home page of the `PackageFormula`.

This command depends of `#'WebBrowser'`.


"
Class {
	#name : #PackageFormulasCtxOpenHomepageCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxOpenHomepageCommand class >> defaultDescription [

	^ 'Open homepage'
]

{ #category : #initialization }
PackageFormulasCtxOpenHomepageCommand class >> defaultIconName [

	^ #home
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxOpenHomepageCommand class >> defaultName [

	^ 'Visit Homepage'
]

{ #category : #executing }
PackageFormulasCtxOpenHomepageCommand >> execute [
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	self webBrowser openOn: self selectedFormula info webLinkHome.

]
