"
Abstract class grouping behavior for contextual menus in the PackageFormulas application.

Subclasses implement behavior accessible through right-click menus in the formulas list.
"
Class {
	#name : #PackageFormulasContextualMenuCommand,
	#superclass : #CmCommand,
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
