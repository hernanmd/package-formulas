"
Abstract class grouping behavior for contextual menus in the PackageFormulas application.

Subclasses implement behavior accessible through right-click menus in the formula categories list.
"
Class {
	#name : #PFCatContextualMenuCommand,
	#superclass : #CmCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #accessing }
PFCatContextualMenuCommand >> application [

	^ self context application
]

{ #category : #accessing }
PFCatContextualMenuCommand >> applicationClass [

	^ self application class
]

{ #category : #accessing }
PFCatContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
PFCatContextualMenuCommand >> formulasTableColumns [

	^ 	self formulasTable columns
]

{ #category : #accessing }
PFCatContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]
