"
A command to open a Playground with a formula to edit and play.
"
Class {
	#name : #PFCtxOpenPlaygroundCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFCtxOpenPlaygroundCommand class >> defaultDescription [

	^ 'Open a Playground with Formula contents'
]

{ #category : #initialization }
PFCtxOpenPlaygroundCommand class >> defaultIconName [

	^ #workspace
]

{ #category : #default }
PFCtxOpenPlaygroundCommand class >> defaultName [

	^ 'Open Playground Formula'
]

{ #category : #execution }
PFCtxOpenPlaygroundCommand >> execute [
	"Open a Playground with the selected formula"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	Smalltalk tools workspace openContents: self selectedFormula sourceCode.
]
