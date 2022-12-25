"
Abstract class grouping behavior for contextual menus in the PackageFormulas application.

Subclasses implement behavior accessible through right-click menus in the formula categories list.
"
Class {
	#name : #PFCategoriesContextualMenuCommand,
	#superclass : #CmCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #accessing }
PFCategoriesContextualMenuCommand >> application [

	^ self context application
]

{ #category : #accessing }
PFCategoriesContextualMenuCommand >> applicationClass [

	^ self application class
]

{ #category : #accessing }
PFCategoriesContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
PFCategoriesContextualMenuCommand >> formulasTableColumns [

	^ 	self formulasTable columns
]

{ #category : #accessing }
PFCategoriesContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]
