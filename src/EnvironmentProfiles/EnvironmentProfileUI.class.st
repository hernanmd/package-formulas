Class {
	#name : #EnvironmentProfileUI,
	#superclass : #SpPresenter,
	#instVars : [
		'metacelloTable',
		'selectedFormulas',
		'toolbar'
	],
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #initialization }
EnvironmentProfileUI >> initialExtent [
 
	^ 400@600
]

{ #category : #initialization }
EnvironmentProfileUI >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom
		add: #metacelloTable;
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

	metacelloTable := self newTable.
	metacelloTable
		addColumn:
			((SpCheckBoxTableColumn title: ' ' evaluated: [ :pragma | self selectedFormulas includes: pragma ])
				onActivation: [ :class | self selectedFormulas add: class ];
				onDeactivation: [ :class | self selectedFormulas remove: class ];
				width: 20;
				yourself);	
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [: p | p method selector capitalized ]);
		addColumn: ((SpCheckBoxTableColumn title: 'Installed' evaluated: [: pragma | pragma hasFormulaInstalled ])
				width: 90;
				yourself);			
		"addColumn: (SpStringTableColumn title: 'Number of subclasses' evaluated: [ :class | class subclasses size asString ]);"
		items: self application formulas asSortedCollection;
		whenSelectionChangedDo: [ : selection | 
			self application propertyAt: #selection put: selection selectedItem ];
		beResizable. 

]

{ #category : #initialization }
EnvironmentProfileUI >> initializeToolbar [

	toolbar := self newToolbar
		addStyle: 'stToolbar';
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
		register: (EnvironmentProfileInspectCommand forSpecContext: self);
		yourself
]
