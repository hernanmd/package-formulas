"
Command to unselect all the displayed formulas in the receiver's context.

"
Class {
	#name : #PFCtxSelectNoneCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFCtxSelectNoneCommand class >> defaultDescription [

	^ 'Unselect all formulas'
]

{ #category : #initialization }
PFCtxSelectNoneCommand class >> defaultIconName [

	^ #checkboxUnselected
]

{ #category : #'accessing - defaults' }
PFCtxSelectNoneCommand class >> defaultName [

	^ 'Select None'
]

{ #category : #executing }
PFCtxSelectNoneCommand >> execute [
	"Unselect all marked formula items"

	self context selectedFormulas: Set empty.
	self formulasTable refresh
]
