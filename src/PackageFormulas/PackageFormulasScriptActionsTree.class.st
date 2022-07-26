"
This presenter holds a tree of possible actions for three main types of scenarios:

- Pre-install actions.
- Installation wrapping actions.
- Post- install actions.

Common installation actions are:

- Save image after install.
- Log execution.
- Background installation.
- Simulate loading.
- Schedule installation.
"
Class {
	#name : #PackageFormulasScriptActionsTree,
	#superclass : #SpPackageFormulasPresenter,
	#instVars : [
		'actionsMap',
		'actionsPostTreePresenter',
		'actionsPreTreePresenter',
		'selectedWrapperActions',
		'actionsWrapperTreePresenter',
		'actions',
		'selectedPostInstallActions',
		'selectedPreInstallActions',
		'formulas'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #'instance creation' }
PackageFormulasScriptActionsTree class >> open [
	<script>

	^ self new 
		open;
		yourself
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> actions [

	^ actions
		ifNil: [ actions := OrderedCollection new ]
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> actionsAt: selection [

	^ self actionsMap at: selection
		
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> actionsMap [

	^ actionsMap
		ifNil: [ actionsMap := self defaultActionsMap ]
]

{ #category : #'add-remove' }
PackageFormulasScriptActionsTree >> addPostAction: frmAction [

	self selectedPostInstallActions add: frmAction.
	self updatePostActions
]

{ #category : #'add-remove' }
PackageFormulasScriptActionsTree >> addPreAction: frmAction [

	self selectedPreInstallActions add: frmAction.
	self updatePreActions
]

{ #category : #'add-remove' }
PackageFormulasScriptActionsTree >> addWrapperAction: frmAction [

	self selectedWrapperActions add: frmAction.
	self updateWrapperActions
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultActionsMap [

	^ Dictionary new
		at: 'Pre-install' put: self defaultPreInstallActions;
		at: 'Wrappers' put: self defaultWrapperInstallActions;
		at: 'Post-install' put: self defaultPostInstallActions;
		yourself
		
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: #actionsPreTreePresenter;
		add: #actionsWrapperTreePresenter;
		add: #actionsPostTreePresenter;
		yourself
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultPostInstallActions [

	^ { 
		((PFPostInstallDecoration named: 'Open Workspace')
			sourceCode: 'Smalltalk tools workspace open.') .
			
		((PFPostInstallDecoration named: 'Open Test Runner')
			sourceCode: 'Smalltalk tools openTestRunner.')	.
				
		((PFPostInstallDecoration named: 'Open Help Browser')
			sourceCode: 'HelpBrowser open.') .
			
		((PFPostInstallDecoration named: 'Log finish')
			sourceCode: '''Installation finished'' asBeaconSignal log.') .

	 }
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultPreInstallActions [

	^ { 

		((PFPreInstallDecoration named: 'Open Transcript')
			sourceCode: 'Smalltalk tools openTranscript	.') .
	
		((PFPreInstallDecoration named: 'Log start')
			sourceCode: '''Installation started'' asBeaconSignal log.') . 
			
		((PFPreInstallDecoration named: 'Save image')
			sourceCode: '(Smalltalk snapshot: true andQuit: false)
				ifFalse: [ UIManager default inform: ''Image saved'' ].')
				
		}
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultWrapperInstallActions [

	^ { 

		(PFBackgroundWrapper named: 'Background install') .
		(PFBenchmarkWrapper	named: 'Benchmark') .
		(PFProfileWrapper named: 'Profile') .
		(PFDisableMonitorWrapper named: 'Disable monitor') . 
		((PFExceptionWrapper named: 'Install exception')
			exceptionClass: Error;
			sourceCode: 'self halt')	
	}
]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> formulas [
	"Answer the receciver's <PackageFormulaCollection>"

	self halt.
	^ self owner formulas
]

{ #category : #testing }
PackageFormulasScriptActionsTree >> includes: aPackageFormulaAction [

	^ self actions includes: aPackageFormulaAction
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePostInstallAvailableActions [

	actionsPostTreePresenter := self newTable
		addColumn: (SpCheckBoxTableColumn new
			width: 20;
			evaluated: [ :frmAction | self selectedPostInstallActions includes: frmAction ];
			onActivation: [ : frmAction | self addPostAction: frmAction ];
			onDeactivation: [ :frmAction | self removePostAction: frmAction ]);
		addColumn: (SpStringTableColumn 
			title: 'Post-install actions' 
			evaluated: [ :anAction | anAction name ]);
		items: self postInstallActions;	
		yourself.

]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePreInstallAvailableActions [

	actionsPreTreePresenter := self newTable
		addColumn: (SpCheckBoxTableColumn new
			width: 20;
			evaluated: [ :frmAction | self selectedPreInstallActions includes: frmAction ];
			onActivation: [ :frmAction | self addPreAction: frmAction ];
			onDeactivation: [ :frmAction | self removePreAction: frmAction ]);
		addColumn: (SpStringTableColumn 
			title: 'Pre-install Actions' 
			evaluated: [ :anAction | anAction name ]);			
		items: self preInstallActions;	
		yourself.
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePresenters [

	self layout: self defaultLayout.

	self 
		initializePreInstallAvailableActions;
		initializeWrapperInstallAvailableActions;
		initializePostInstallAvailableActions

]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializeWrapperInstallAvailableActions [

	actionsWrapperTreePresenter := self newTable
		addColumn: (SpCheckBoxTableColumn new
			width: 20;
			evaluated: [ : frmAction | self selectedWrapperActions includes: frmAction ];
			onActivation: [ :frmAction | self addWrapperAction: frmAction ];
			onDeactivation: [ :frmAction | self removeWrapperAction: frmAction ]);
		addColumn: (SpStringTableColumn 
			title: 'Wrapper actions' 
			evaluated: [ :anAction | anAction name ]);			
		items: self wrapperActions;	
		yourself.

]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> installation [

	^ self owner installation
]

{ #category : #'instance creation' }
PackageFormulasScriptActionsTree >> open [

	(PackageFormulasApp newApplication: self application) open
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> postInstallActions [

	^ self actionsAt: 'Post-install'
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> preInstallActions [

	^ self actionsAt: 'Pre-install'
]

{ #category : #'add-remove' }
PackageFormulasScriptActionsTree >> removePostAction: frmAction [

	self selectedPostInstallActions remove: frmAction.
	self updatePostActions.
]

{ #category : #'add-remove' }
PackageFormulasScriptActionsTree >> removePreAction: frmAction [

	self selectedPreInstallActions remove: frmAction.
	self updatePreActions.
]

{ #category : #'add-remove' }
PackageFormulasScriptActionsTree >> removeWrapperAction: frmAction [

	self selectedWrapperActions remove: frmAction.
	self updateWrapperActions.
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> selectedPostInstallActions [

	^ selectedPostInstallActions
		ifNil: [ selectedPostInstallActions := OrderedCollection new ]
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> selectedPreInstallActions [

	^ selectedPreInstallActions
		ifNil: [ selectedPreInstallActions := OrderedCollection new ]
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> selectedWrapperActions [

	^ selectedWrapperActions
		ifNil: [ selectedWrapperActions := OrderedCollection new ]
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> toolbarHeight [

	^ self class toolbarHeight
]

{ #category : #updating }
PackageFormulasScriptActionsTree >> updatePostActions [

	self owner postActionsPresenterSetEmpty.
	self selectedPostInstallActions do: [ :fAction | 
		self formula addDecoration: fAction.		
		self owner postActionsPresenterAddText: fAction sourceCode ]
]

{ #category : #updating }
PackageFormulasScriptActionsTree >> updatePreActions [

	self owner preActionsPresenterSetEmpty.
	self installation initializeBeforeDecoration.
	self selectedPreInstallActions do: [ :fAction | 
		self installation addDecoration: fAction.
		self owner preActionsPresenterAddText: fAction sourceCode ]
]

{ #category : #updating }
PackageFormulasScriptActionsTree >> updateWrapperActions [

	self owner wrapperPresenterSetEmpty.
	self installation initialize.
	self selectedWrapperActions do: [ :fAction | 
		self installation addDecoration: fAction ].
	self owner wrapperPresenterUpdate: self installation.
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> wrapperActions [

	^ self actionsAt: 'Wrappers'
]
