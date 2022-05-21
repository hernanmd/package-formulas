"
Abstract class grouping behavior for contextual menus in the PackageFormulas application.

Subclasses implement behavior accessible through right-click menus in the formula categories list.
"
Class {
	#name : #PackageCategoriesContextualMenuCommand,
	#superclass : #CmCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #accessing }
PackageCategoriesContextualMenuCommand >> application [

	^ self context application
]

{ #category : #accessing }
PackageCategoriesContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
PackageCategoriesContextualMenuCommand >> formulasTableColumns [

	^ 	self formulasTable columns
]

{ #category : #accessing }
PackageCategoriesContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]
