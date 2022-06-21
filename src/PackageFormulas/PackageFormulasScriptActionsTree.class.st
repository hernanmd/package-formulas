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
		'actionsTreePresenter',
		'actionsTypesPresenter',
		'actionsMap',
		'actionsLabelPresenter',
		'actionsDetailPresenter'
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
PackageFormulasScriptActionsTree >> actionsAt: selection [

	^ self actionsMap at: selection selectedItem
		
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> actionsMap [

	^ actionsMap
		ifNil: [ actionsMap := self defaultActionsMap ]
]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> actionsTreePresenter [

	^ actionsTreePresenter
]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> actionsTreePresenter: anObject [

	actionsTreePresenter := anObject
]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> actionsTypesPresenter [

	^ actionsTypesPresenter
]

{ #category : #accessing }
PackageFormulasScriptActionsTree >> actionsTypesPresenter: anObject [

	actionsTypesPresenter := anObject
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
		add: #actionsTypesPresenter;
		add: #actionsLabelPresenter height: self labelHeight;
		add: #actionsTreePresenter;
		yourself
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultPostInstallActions [

	^ { 
		((PackageFormulaBeforeInstall named: 'Open Workspace')
			sourceCode: 'Smalltalk tools workspace open.') .
			
		((PackageFormulaBeforeInstall named: 'Open Test Runner')
			sourceCode: 'Smalltalk tools openTestRunner.')	.
				
		((PackageFormulaBeforeInstall named: 'Open Help Browser')
			sourceCode: 'HelpBrowser open.') .
			
		((PackageFormulaBeforeInstall named: 'Log start')
			sourceCode: '''Installation finished'' asBeaconSignal log.') .

	 }
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultPreInstallActions [

	^ { 

		((PackageFormulaBeforeInstall named: 'Open Transcript')
			sourceCode: 'Smalltalk tools openTranscript	.') .
	
		((PackageFormulaBeforeInstall named: 'Log start')
			sourceCode: '''Installation started'' asBeaconSignal log.') . 
			
		((PackageFormulaBeforeInstall named: 'Save image')
			sourceCode: '(Smalltalk snapshot: true andQuit: false)
				ifFalse: [ UIManager default inform: ''Image saved'' ].')
				
		}
]

{ #category : #defaults }
PackageFormulasScriptActionsTree >> defaultWrapperInstallActions [

	^ { 

		(PackageFormulaBackgroundWrapper named: 'Background install') .
	
		(PackageFormulaDisableMonitorWrapper named: 'Disable monitor') . 
			
		((PackageFormulaExceptionWrapper named: 'Install exception')
			exceptionClass: Error;
			sourceCode: 'self halt')	
	}
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePresenters [

	self layout: self defaultLayout.
	actionsTypesPresenter := self newList
		items: self installActions;
		beSingleSelection;
		whenSelectionChangedDo: [ : selection | self actionsTreePresenter items: (self actionsAt: selection) ];
		yourself.
	
	actionsLabelPresenter := self newLabel label: 'Available actions'; yourself.
	actionsTreePresenter := 	self newList
		beSingleSelection;
		display: #name;
		whenSelectionChangedDo: [ : selection |  ];
		yourself.
		
	actionsDetailPresenter := self newText.
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> installActions [

	^ #(
		'Pre-install'
		'Wrappers'
		'Post-install'
		)
]

{ #category : #'instance creation' }
PackageFormulasScriptActionsTree >> open [

	(PackageFormulasApp newApplication: self application) open
]
