"
Command to select all the displayed formulas in the receiver's context.
"
Class {
	#name : #PFCtxSelectAllCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #'accessing - defaults' }
PFCtxSelectAllCommand class >> defaultDescription [

	^ 'Select all formulas'
]

{ #category : #initialization }
PFCtxSelectAllCommand class >> defaultIconName [

	^ #checkedBox
]

{ #category : #default }
PFCtxSelectAllCommand class >> defaultName [

	^ 'Select All'
]

{ #category : #executing }
PFCtxSelectAllCommand >> execute [
	"Select all uninstalled formula items"

	self context selectedFormulas: self formulasTableItems.
	self formulasTable refresh
]
