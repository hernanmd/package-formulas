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
		'selectedWrapperActions',
		'actions',
		'selectedPostInstallActions',
		'selectedPreInstallActions',
		'actionsPostTreePresenter',
		'actionsPreTreePresenter',
		'actionsWrapperTreePresenter'
	],
	#category : #'PackageFormulas-UI-UI'
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

{ #category : #layout }
PackageFormulasScriptActionsTree >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 3;
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

		((PFPostInstallDecoration named: 'Open Class Hierarchy Browser')
			sourceCode: 'Smalltalk tools browser open.') .

		((PFPostInstallDecoration named: 'Log finished')
			sourceCode: '''Installation finished'' asBeaconSignal emit.') .
			
		((PFPostInstallDecoration named: 'Available memory')
			sourceCode: 'Smalltalk tools workspace openContents: Smalltalk image spaceLeftAfterGarbageCollection surroundedBySingleQuotes.') .
			
		((PFPostInstallDecoration named: 'Image cleanup')
			sourceCode: 'Smalltalk image cleanUp.') .
			
		((PFPostInstallDecoration named: 'Image cleanup (aggressive)')
			sourceCode: 'Smalltalk image cleanUp: true.') .
	 }
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultPreInstallActions [

	^ { 

		((PFPreInstallDecoration named: 'Open Transcript')
			sourceCode: 'Smalltalk tools openTranscript.') .
				
		((PFPreInstallDecoration named: 'Open Process Browser')
			sourceCode: 'Smalltalk tools processBrowser open.') .

		((PFPreInstallDecoration named: 'Garbage collect')
			sourceCode: '5 timesRepeat: [ Smalltalk garbageCollect ].') .

		((PFPreInstallDecoration named: 'Log start')
			sourceCode: '''Installation started'' asBeaconSignal emit.') . 

		((PFPreInstallDecoration named: 'Disable deprecation warning')
			sourceCode: 'Deprecation raiseWarning: false; showWarning: false.') . 
	
		((PFPreInstallDecoration named: 'Save image')
			sourceCode: '(Smalltalk snapshot: true andQuit: false)
				ifFalse: [ UIManager default inform: ''Image saved'' ].') .
				
		((PFPreInstallDecoration named: 'Clean up processes')
			sourceCode: 'ImageCleaner cleanUpProcesses.') .

		((PFPreInstallDecoration named: 'Clean up image')
			sourceCode: 'Smalltalk cleanUp: true except: #() confirming: false.') .

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
			exceptionClass: Error "IceGenericError";
			sourceCode: '[ : ex | self halt ]')	
	}
]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> formulas [
	"Answer the receciver's <PackageFormulaCollection>"

	^ self owner formulas
]

{ #category : #testing }
PackageFormulasScriptActionsTree >> includes: aPackageFormulaAction [

	^ self actions includes: aPackageFormulaAction
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePostInstallAvailableActions [

	actionsPostTreePresenter := self newTable
		                            addColumn: self newPkgActionCheckbox;
		                            addColumn: (SpStringTableColumn
				                             title: 'Post-install actions'
				                             evaluated: [ :anAction | 
					                             anAction name ]);
		                            items: self postInstallActions;
		                            yourself
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePreInstallAvailableActions [

	actionsPreTreePresenter := self newTable
		                           addColumn: self newPkgActionCheckbox;
		                           addColumn: (SpStringTableColumn
				                            title: 'Pre-install Actions'
				                            evaluated: [ :anAction | 
					                            anAction name ]);
		                           items: self preInstallActions;
		                           yourself
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
		                               addColumn: self newPkgActionCheckbox;
		                               addColumn: (SpStringTableColumn
				                                title: 'Wrapper actions'
				                                evaluated: [ :anAction | 
					                                anAction name ]);
		                               items: self wrapperActions;
		                               yourself
]

{ #category : #updating }
PackageFormulasScriptActionsTree >> installation [

	^ self owner installation
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> newPkgActionCheckbox [

	^ SpCheckBoxTableColumn new
		  width: 20;
		  evaluated: [ :frmAction | 
			  self selectedWrapperActions includes: frmAction ];
		  onActivation: [ :frmAction | self addWrapperAction: frmAction ];
		  onDeactivation: [ :frmAction | 
			  self removeWrapperAction: frmAction ]
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
