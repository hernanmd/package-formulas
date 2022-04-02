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

{ #category : #'instance creation' }
EnvironmentProfileUI class >> open [
	<example>

	self new openWithSpec
]

{ #category : #initialization }
EnvironmentProfileUI >> initialExtent [
 
	^ 600@400
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
			((SpCheckBoxTableColumn title: ' ' evaluated: [ :class | self selectedFormulas includes: class ])
				onActivation: [ :class | self selectedFormulas add: class ];
				onDeactivation: [ :class | self selectedFormulas remove: class ];
				width: 20;
				yourself);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [: p | p method selector capitalized ]);
		"addColumn: (SpStringTableColumn title: 'Number of subclasses' evaluated: [ :class | class subclasses size asString ]);"
		items: self application formulas;
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
		yourself
]
