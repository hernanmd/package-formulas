"
Abstract class grouping behavior for contextual menus in the PackageFormulas application.

Subclasses implement behavior accessible through right-click menus in the formulas list.
"
Class {
	#name : #PackageFormulasContextualMenuCommand,
	#superclass : #CmCommand,
	#instVars : [
		'querier'
	],
	#category : #'PackageFormulas-Commands'
}

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> application [

	^ self context application
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> formulasTableColumns [

	^ 	self formulasTable columns
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> querier [
	"Answer the receiver's object to make queries to package formulas"
	
	^ querier
		ifNil: [ querier := PackageFormulaBaselineQuerier new ]
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> stBrowser [

	^ Smalltalk tools browser
]

{ #category : #accessing }
PackageFormulasContextualMenuCommand >> webBrowser [

	^ WebBrowser
]
