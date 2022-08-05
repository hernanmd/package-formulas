"
Presents a list of formulas for a specific category.

ToDo: Currently it also holds the selected formulas, although that could not be necessary.
 
Internal Representation and Key Implementation Points.

Instance Variables
	formulasTable:		<Object>
	selectedFormulas:		<Object>

"
Class {
	#name : #PackageFormulasSelectorUI,
	#superclass : #SpPackageFormulasPresenter,
	#instVars : [
		'formulasTable'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildBrowsingOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'BrowseOperationsMenu') asSpecGroup
		register: ((PFCtxBrowseFormulaCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'B' asShortcut) 
				context: presenterInstance);
		register: ((PFCtxBrowseBaselineCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'M' asShortcut) 
				context: presenterInstance);				
		register: ((PFCtxBrowsePkgCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'S' asShortcut) 
				context: presenterInstance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildEPContextualGroupWith: presenterInstance)
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildEPContextualGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'PFSelContextualMenu') asSpecGroup
		register: (self buildBrowsingOperationsGroupWith: presenterInstance);
		register: (self buildSelectionOperationsGroupWith: presenterInstance);
		register: (self buildRepositoryOperationsGroupWith: presenterInstance);
		register: (self buildFormulaOperationsGroupWith: presenterInstance);		
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildFormulaOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'FormulaOperationsMenu') asSpecGroup
		register: ((PFCtxOpenPlaygroundCommand
			forSpecWithIconNamed: #glamorousBrowse
			shortcutKey: 'P' asShortcut) 
				context: presenterInstance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildRepositoryOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'RepositoryOperationsMenu') asSpecGroup
		register: ((PFCtxOpenHomepageCommand
			forSpecWithIconNamed: #smallOpen
			shortcutKey: 'H' asShortcut) 
				context: presenterInstance;
				description: 'Open a web browser on the selected repository homepage');			
		register: ((PFCtxOpenIssueCommand 
			forSpecWithIconNamed: #smallError
			shortcutKey: 'I' asShortcut)
				context: presenterInstance;
				description: 'Open a web browser on the selected repository issues page');
		register: ((PFCtxRemoveBaselineCommand 
			forSpecWithIconNamed: #smallDelete
			shortcutKey: 'D' asShortcut)
				context: presenterInstance;
				description: 'Remove the baseline of selected formula');
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
PackageFormulasSelectorUI class >> buildSelectionOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'SelectionOperationsMenu') asSpecGroup
		register: ((PFCtxSelectAllCommand
			forSpecWithIconNamed: #checkedBox
			shortcutKey: 'A' asShortcut) 
				context: presenterInstance);			
		register: ((PFCtxSelectNoneCommand 
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

	self formulasTable items: aCollection asOrderedCollection
]

{ #category : #accessing }
PackageFormulasSelectorUI >> formulasTable [

	^ formulasTable
]

{ #category : #callbacks }
PackageFormulasSelectorUI >> handleSelectorChange: anObject [
	"Private - Handle selection focus. Update current selection if anObject is not nil"

	anObject ifNotNil: [ 
		self application propertyAt: #formulaSelection put: anObject ]
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
				onDeactivation: [ : formula | self unselectFormula: formula ];
				beNotExpandable;
				width: 20;
				yourself);	
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [: p | p method selector capitalized ]);
		addColumn: ((SpCheckBoxTableColumn title: 'Installed' evaluated: [: formula | formula hasPackageInstalled ])
				"enabled: false;"
				width: 90;
				yourself);		
		addColumn: ((SpCheckBoxTableColumn title: 'Baseline' evaluated: [: formula | formula hasInstallerInstalled ])
				width: 90;
				yourself);			
		items: OrderedCollection new;
		alternateRowsColor;
		searchMatching: [ :selFormula :textToSearch | selFormula selector beginsWith: textToSearch ];
		whenSelectionChangedDo: [ : selection | self handleSelectorChange: selection selectedItem ];
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
PackageFormulasSelectorUI >> selectedFormulas [
	"Answer a <Collection> of formulas marked for installation"

	^ self application selectedFormulas

]

{ #category : #initialization }
PackageFormulasSelectorUI >> unselectFormula: aFormula [

	(self selectedFormulas includes: aFormula)
		ifTrue: [ self selectedFormulas remove: aFormula ].
	self formulasTable refresh.
]

{ #category : #initialization }
PackageFormulasSelectorUI >> updateSelectedFormula: formula [

	formula hasInstallerInstalled ifTrue: [ ^ self ].
	self application 
		propertyAt: #selectedFormulas
		ifPresent: [ : selFmls | selFmls add: formula ]
		ifAbsentPut: [ Set new ].
	"self selectedFormulas add: formula."
	self owner increaseFormulaCount
]

{ #category : #callbacks }
PackageFormulasSelectorUI >> updateWithFormulasIn: aSelectedCategory [
	"Private - Category selection has changed, update the displayed formulas"

	self formulasItems: (self formulasIn: aSelectedCategory) asSortedCollection
]
