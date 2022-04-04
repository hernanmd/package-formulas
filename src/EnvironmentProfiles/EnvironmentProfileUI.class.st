Class {
	#name : #EnvironmentProfileUI,
	#superclass : #SpPresenter,
	#instVars : [
		'selectedFormulas',
		'toolbar',
		'formulasTable'
	],
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #accessing }
EnvironmentProfileUI class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildEPContextualGroupWith: presenterInstance)
]

{ #category : #accessing }
EnvironmentProfileUI class >> buildEPContextualGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'EPContextualMenu') asSpecGroup
		register: (self buildSelectionOperationsGroupWith: presenterInstance);	
		register: (self buildRepositoryOperationsGroupWith: presenterInstance);
		yourself
]

{ #category : #accessing }
EnvironmentProfileUI class >> buildRepositoryOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'RepositoryOperationsMenu') asSpecGroup
		register: ((EnvironmentProfileVisitHomepageCommand
			forSpecWithIconNamed: #smallOpen
			shortcutKey: 'H' asShortcut) 
				context: presenterInstance;
				description: 'Open a web browser on the selected repository homepage');			
		register: ((EnvironmentProfileOpenIssueCommand 
			forSpecWithIconNamed: #smallError
			shortcutKey: 'I' asShortcut)
				context: presenterInstance;
				description: 'Open a web browser on the selected repository issues page');
		beDisplayedAsGroup;
		yourself
]

{ #category : #accessing }
EnvironmentProfileUI class >> buildSelectionOperationsGroupWith: presenterInstance [

	^ (CmCommandGroup named: 'SelectionOperationsMenu') asSpecGroup
		register: ((EnvironmentProfileSelectAllCommand
			forSpecWithIconNamed: #checkedBox
			shortcutKey: 'A' asShortcut) 
				context: presenterInstance);			
		register: ((EnvironmentProfileSelectNoneCommand 
			forSpecWithIconNamed: #checkboxUnselected
			shortcutKey: 'N' asShortcut)
				context: presenterInstance);
		beDisplayedAsGroup;
		yourself
]

{ #category : #initialization }
EnvironmentProfileUI >> initialExtent [
 
	^ 400@600
]

{ #category : #initialization }
EnvironmentProfileUI >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom
		add: #formulasTable;
		add: #toolbar height: self class toolbarHeight;
		yourself)
]

{ #category : #initialization }
EnvironmentProfileUI >> initializePresenters [

	self initializeSelectableFormulas.
	self initializeToolbar.
	self initializeLayout.

]

{ #category : #initialization }
EnvironmentProfileUI >> initializeSelectableFormulas [

	formulasTable := self newTable.
	formulasTable
		addColumn:
			((SpCheckBoxTableColumn title: ' ' evaluated: [ :pragma | self selectedFormulas includes: pragma ])
				onActivation: [ :pragma | pragma hasFormulaInstalled ifFalse: [ self selectedFormulas add: pragma ] ];
				onDeactivation: [ :pragma | self selectedFormulas remove: pragma ];
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
EnvironmentProfileUI >> initializeToolbar [

	toolbar := self newToolbar
		"addStyle: 'stToolbar';"
		"displayMode: self application toolbarDisplayMode;"
		fillWith: self toolbarActions;
		yourself
]

{ #category : #initialization }
EnvironmentProfileUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self initialExtent;
		windowIcon: self windowIcon
]

{ #category : #accessing }
EnvironmentProfileUI >> selectedFormulas [

	^ selectedFormulas
		ifNil: [ selectedFormulas := OrderedCollection new ]
]

{ #category : #initialization }
EnvironmentProfileUI >> title [ 

	^ 'Formulas to install'
]

{ #category : #initialization }
EnvironmentProfileUI >> toolbarActions [

	^ CmCommandGroup forSpec
		register: (EnvironmentProfileInstallCommand forSpecContext: self);
		register: (EnvironmentProfileBrowseCommand forSpecContext: self);
		register: (EnvironmentProfileQuitCommand forSpecContext: self);		
		yourself
]
