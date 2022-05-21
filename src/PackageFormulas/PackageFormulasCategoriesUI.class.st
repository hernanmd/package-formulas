Class {
	#name : #PackageFormulasCategoriesUI,
	#superclass : #SpPresenter,
	#instVars : [
		'categoriesList'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #accessing }
PackageFormulasCategoriesUI class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildPFCatContextualGroupWith: presenterInstance)
]

{ #category : #accessing }
PackageFormulasCategoriesUI class >> buildPFCatContextualGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'PFCatContextualMenu') asSpecGroup
		register: (self buildSelectionOperationsGroupWith: presenterInstance);	
		yourself
]

{ #category : #accessing }
PackageFormulasCategoriesUI class >> buildSelectionOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'SelectionOperationsMenu') asSpecGroup
		register: ((PackageCategoriesCtxBrowseCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'B' asShortcut) 
				context: presenterInstance);		
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
PackageFormulasCategoriesUI >> categoriesList [

	^ categoriesList
]

{ #category : #accessing }
PackageFormulasCategoriesUI >> categoriesList: anObject [

	categoriesList := anObject
]

{ #category : #initialization }
PackageFormulasCategoriesUI >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom
		add: #categoriesList;
		yourself)
]

{ #category : #initialization }
PackageFormulasCategoriesUI >> initializePresenters [

	self initializeSelectableCategories.
	self initializeLayout.

]

{ #category : #initialization }
PackageFormulasCategoriesUI >> initializeSelectableCategories [

	categoriesList	:= self newList
		items: self application formulasCategories asSortedCollection;
		whenSelectionChangedDo: [ self refreshFormulasSelector: self selectedCategory ];
		contextMenu: [ (self rootCommandsGroup / 'PFCatContextualMenu') beRoot asMenuPresenter ]

]

{ #category : #accessing }
PackageFormulasCategoriesUI >> items: aCollection [ 
	
	self categoriesList items: aCollection
]

{ #category : #callbacks }
PackageFormulasCategoriesUI >> refreshFormulasSelector: aString [ 
	"Private - Refresh the formulas in the receiver's selector"

	self owner refreshFormulasSelector: aString.
]

{ #category : #initialization }
PackageFormulasCategoriesUI >> selectedCategory [
	"Answer a <> with the currently selected category"

	^ self categoriesList selectedItem
]
