"
Display a list of category items found in `PackageFormulas class`.
Categories are defined as a `Symbol` in parameters of each `PackageFormula`.

Note that a `PackageFormula` can belong to multiple categories.
"
Class {
	#name : #PackageFormulasCategoriesUI,
	#superclass : #SpPackageFormulasPresenter,
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
			forSpecWithIconNamed: #class
			shortcutKey: 'B' asShortcut) 
				context: presenterInstance);
		register: ((PackageCategoriesCtxRequestCommand 
			forSpecWithIconNamed: #packageAdd
			shortcutKey: 'R' asShortcut) 
				context: presenterInstance);					
		beDisplayedAsGroup;
		yourself
]

{ #category : #initialization }
PackageFormulasCategoriesUI >> allCategories [

	^ self sortedFormulasCategories add: 'All'; yourself
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
PackageFormulasCategoriesUI >> formulasCategories [

	^ self application formulasCategories
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
		items: self allCategories;
		whenSelectionChangedDo: [ self updateWithFormulasIn: self selectedCategory ];
		contextMenu: [ (self rootCommandsGroup / 'PFCatContextualMenu') beRoot asMenuPresenter ]

]

{ #category : #accessing }
PackageFormulasCategoriesUI >> items: aCollection [ 
	
	self categoriesList items: aCollection
]

{ #category : #initialization }
PackageFormulasCategoriesUI >> selectedCategory [
	"Answer a <Symbol> reoresenting the currently selected category"

	^ self categoriesList selectedItem
]

{ #category : #initialization }
PackageFormulasCategoriesUI >> sortedFormulasCategories [
	
	^ self formulasCategories asSortedCollection
]

{ #category : #accessing }
PackageFormulasCategoriesUI >> unselect [

	self categoriesList unselectAll.
]

{ #category : #callbacks }
PackageFormulasCategoriesUI >> updateWithFormulasIn: aString [ 
	"Private - Refresh the formulas in the receiver's selector"

	aString ifNotNil: [ 
		self owner 
			updateWithFormulasIn: aString;
			updateStatusBar ]
]
