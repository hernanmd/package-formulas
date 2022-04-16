Class {
	#name : #PackageFormulasSelectorUI,
	#superclass : #SpPresenter,
	#instVars : [
		'selectedFormulas',
		'toolbar',
		'formulasTable'
	],
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildEPContextualGroupWith: presenterInstance)
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildEPContextualGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'EPContextualMenu') asSpecGroup
		register: (self buildSelectionOperationsGroupWith: presenterInstance);	
		register: (self buildRepositoryOperationsGroupWith: presenterInstance);
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildRepositoryOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'RepositoryOperationsMenu') asSpecGroup
		register: ((PackageFormulasOpenHomepageCommand
			forSpecWithIconNamed: #smallOpen
			shortcutKey: 'H' asShortcut) 
				context: presenterInstance;
				description: 'Open a web browser on the selected repository homepage');			
		register: ((PackageFormulasOpenIssueCommand 
			forSpecWithIconNamed: #smallError
			shortcutKey: 'I' asShortcut)
				context: presenterInstance;
				description: 'Open a web browser on the selected repository issues page');
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildSelectionOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'SelectionOperationsMenu') asSpecGroup
		register: ((PackageFormulasSelectAllCommand
			forSpecWithIconNamed: #checkedBox
			shortcutKey: 'A' asShortcut) 
				context: presenterInstance);			
		register: ((PackageFormulasSelectNoneCommand 
			forSpecWithIconNamed: #checkboxUnselected
			shortcutKey: 'N' asShortcut)
				context: presenterInstance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI >> formulasTable [

	^ formulasTable
]

{ #category : #initialization }
PackageFormulasSelectorUI >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom
		add: #formulasTable;
		yourself)
]

{ #category : #initialization }
PackageFormulasSelectorUI >> initializePresenters [

	self initializeSelectableFormulas.
	self initializeLayout.

]

{ #category : #initialization }
PackageFormulasSelectorUI >> initializeSelectableFormulas [

	formulasTable := self newTable.
	formulasTable
		addColumn:
			((SpCheckBoxTableColumn title: '' evaluated: [ :pragma | self selectedFormulas includes: pragma ])
				onActivation: [ :pragma | pragma hasFormulaInstalled ifFalse: [ self selectedFormulas add: pragma ] ];
				onDeactivation: [ : formulas | self removeSelections: formulas ];
				beNotExpandable;
				width: 20;
				yourself);	
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [: p | p method selector capitalized ]);
		addColumn: ((SpCheckBoxTableColumn title: 'Installed' evaluated: [: pragma | pragma hasFormulaInstalled ])
				width: 90;
				yourself);			
		items: self application formulas asSortedCollection;
		whenSelectionChangedDo: [ : selection | 
			self application propertyAt: #selection put: selection selectedItem ];
		contextMenu: [ (self rootCommandsGroup / 'EPContextualMenu') beRoot asMenuPresenter ];	
		beResizable. 

]

{ #category : #initialization }
PackageFormulasSelectorUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self initialExtent;
		windowIcon: self windowIcon
]

{ #category : #accessing }
PackageFormulasSelectorUI >> items: aCollection [ 
	
	self formulasTable items: aCollection
]

{ #category : #accessing }
PackageFormulasSelectorUI >> removeSelections: aFormula [ 

	(self selectedFormulas includes: aFormula)
		ifTrue: [ self selectedFormulas remove: aFormula ]
]

{ #category : #accessing }
PackageFormulasSelectorUI >> selectedFormulas [
	"Answer a <Collection> of formulas marked for installation"

	^ selectedFormulas
		ifNil: [ selectedFormulas := OrderedCollection new ]
]
