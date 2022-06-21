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

"
Class {
	#name : #PackageFormulasScriptActionsTree,
	#superclass : #SpPresenter,
	#instVars : [
		'actionsTreePresenter',
		'actionsTypesPresenter',
		'actionsMap'
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
PackageFormulasScriptActionsTree >> actionsFor: selection [

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

{ #category : #initialization }
PackageFormulasScriptActionsTree >> defaultActionsMap [

	^ Dictionary new
		at: 'Pre-install' put: self defaultPreInstallActions;
		at: 'Wrappers' put: self defaultWrapperInstallActions;
		at: 'Post-install' put: self defaultPostInstallActions;
		yourself
		
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: #actionsTypesPresenter; 
		add: #actionsTreePresenter;
		yourself
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> defaultPostInstallActions [

	^ { 'post-install 1' . 'post-install 2' }
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> defaultPreInstallActions [

	^ { 'pre-install 1' . 'pre-install 2' }
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> defaultWrapperInstallActions [

	^ { 'wrap-install 1' . 'wrap-install 2' }
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> initializePresenters [

	self layout: self defaultLayout.
	actionsTypesPresenter := self newList
		items: self installActions;
		beSingleSelection;
		whenSelectionChangedDo: [ : selection | self actionsTreePresenter items: (self actionsFor: selection) ];
		yourself.
	actionsTreePresenter := 	self newList
		beSingleSelection;
		display: [ : action | action printString ];
		whenSelectionChangedDo: [ : selection |  ];
		yourself
]

{ #category : #initialization }
PackageFormulasScriptActionsTree >> installActions [

	^ #('Pre-install'
	'Wrappers'
	'Post-install')
]

{ #category : #'instance creation' }
PackageFormulasScriptActionsTree >> open [

	(PackageFormulasApp newApplication: self application) open
]
