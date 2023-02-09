"
Abstract class grouping behavior for contextual menus in the PackageFormulas application.

Subclasses implement behavior accessible through right-click menus in the formulas list.
"
Class {
	#name : #PFContextualMenuCommand,
	#superclass : #CmCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #initialization }
PFContextualMenuCommand class >> defaultIconName [ 

	self subclassResponsibility
]

{ #category : #accessing }
PFContextualMenuCommand >> application [

	^ self context application
]

{ #category : #executing }
PFContextualMenuCommand >> formulasContainer [

	^ self application formulasContainer
]

{ #category : #accessing }
PFContextualMenuCommand >> formulasTable [

	^ 	self context formulasTable.
]

{ #category : #accessing }
PFContextualMenuCommand >> formulasTableItems [

	^ 	self formulasTable items
]

{ #category : #accessing }
PFContextualMenuCommand >> querier [
	"Answer the receiver's object to make queries to package formulas"

	^ self selectedFormula querier
]

{ #category : #accessing }
PFContextualMenuCommand >> selectedFormula [
	"Answer the currently selected <PackageFormula>, assuming there is one selected"

	^ self application propertyAt: #formulaSelection
]

{ #category : #executing }
PFContextualMenuCommand >> selectedFormulaInfo [

	^ self selectedFormula info
]

{ #category : #executing }
PFContextualMenuCommand >> selectedFormulaMethod [

	^ self selectedFormula method
]

{ #category : #accessing }
PFContextualMenuCommand >> stBrowser [

	^ Smalltalk tools browser
]

{ #category : #accessing }
PFContextualMenuCommand >> webBrowser [

	^ WebBrowser
]
