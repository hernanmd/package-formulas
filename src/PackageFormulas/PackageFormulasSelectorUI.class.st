Class {
	#name : #PackageFormulasSelectorUI,
	#superclass : #SpPackageFormulasPresenter,
	#instVars : [
		'selectedFormulas',
		'formulasTable'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildEPContextualGroupWith: presenterInstance)
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildEPContextualGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'PFSelContextualMenu') asSpecGroup
		register: (self buildSelectionOperationsGroupWith: presenterInstance);	
		register: (self buildRepositoryOperationsGroupWith: presenterInstance);
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildRepositoryOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'RepositoryOperationsMenu') asSpecGroup
		register: ((PackageFormulasCtxOpenHomepageCommand
			forSpecWithIconNamed: #smallOpen
			shortcutKey: 'H' asShortcut) 
				context: presenterInstance;
				description: 'Open a web browser on the selected repository homepage');			
		register: ((PackageFormulasCtxOpenIssueCommand 
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
		register: ((PackageFormulasCtxBrowseFormulaCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'B' asShortcut) 
				context: presenterInstance);
		register: ((PackageFormulasCtxBrowseBaselineCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'M' asShortcut) 
				context: presenterInstance);				
		register: ((PackageFormulasCtxBrowsePkgCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'S' asShortcut) 
				context: presenterInstance);					
		register: ((PackageFormulasCtxSelectAllCommand
			forSpecWithIconNamed: #checkedBox
			shortcutKey: 'A' asShortcut) 
				context: presenterInstance);			
		register: ((PackageFormulasCtxSelectNoneCommand 
			forSpecWithIconNamed: #checkboxUnselected
			shortcutKey: 'N' asShortcut)
				context: presenterInstance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #menu }
PackageFormulasSelectorUI >> formulasIn: aPackageGroupSymbol [
	"Private - Answer a <Collection> for pacakges categorized in aPackageGroupSymbol"
	
	^ self application formulasIn: aPackageGroupSymbol
]

{ #category : #callbacks }
PackageFormulasSelectorUI >> formulasItems: aCollection [
	"Private - Update the displayed formulas with aCollection"

	self formulasTable items: aCollection
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
				onActivation: [ :formula | self updateSelectedFormula: formula ];
				onDeactivation: [ : formula | self updateUnselectedFormula: formula ];
				beNotExpandable;
				width: 20;
				yourself);	
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [: p | p method selector capitalized ]);
		addColumn: ((SpCheckBoxTableColumn title: 'Installed' evaluated: [: formula | formula hasPackageInstalled ])
				"enabled: false;"
				width: 90;
				yourself);		
		addColumn: ((SpCheckBoxTableColumn title: 'Baseline' evaluated: [: formula | formula hasBaselineInstalled ])
				width: 90;
				yourself);			
		items: OrderedCollection new;
		whenSelectionChangedDo: [ : selection | 
			self application propertyAt: #formulaSelection put: selection selectedItem ];
		contextMenu: [ (self rootCommandsGroup / 'PFSelContextualMenu') beRoot asMenuPresenter ];	
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
PackageFormulasSelectorUI >> removeSelections: aFormula [ 

	(self selectedFormulas includes: aFormula)
		ifTrue: [ self selectedFormulas remove: aFormula ]
]

{ #category : #accessing }
PackageFormulasSelectorUI >> selectedFormulas [
	"Answer a <OrderedCollection> of formulas marked for installation"

	^ selectedFormulas
		ifNil: [ selectedFormulas := OrderedCollection new ]
]

{ #category : #initialization }
PackageFormulasSelectorUI >> updateSelectedFormula: formula [

	formula hasBaselineInstalled ifTrue: [ ^ self ].
	self selectedFormulas add: formula.
	self owner increaseFormulaCount
]

{ #category : #initialization }
PackageFormulasSelectorUI >> updateUnselectedFormula: formula [

	self removeSelections: formula.
	self owner decreaseFormulaCount.
]

{ #category : #callbacks }
PackageFormulasSelectorUI >> updateWithFormulasIn: aSelectedCategory [
	"Private - Category selection has changed, update the displayed formulas"

	self formulasItems: (self formulasIn: aSelectedCategory) asSortedCollection
]
