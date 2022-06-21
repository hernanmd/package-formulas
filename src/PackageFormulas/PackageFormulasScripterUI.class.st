Class {
	#name : #PackageFormulasScripterUI,
	#superclass : #SpPackageFormulasPresenter,
	#instVars : [
		'actionsSelectorPresenter',
		'preActionsPresenter',
		'scriptPresenter',
		'postActionsPresenter',
		'preActionsLabel',
		'postActionsLabel',
		'installActionLabel'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #'instance creation' }
PackageFormulasScripterUI class >> open [
	<script>

	^ self new openModalWithSpec
]

{ #category : #accessing }
PackageFormulasScripterUI >> actionsSelectorPresenter [

	^ actionsSelectorPresenter
]

{ #category : #accessing }
PackageFormulasScripterUI >> actionsSelectorPresenter: anObject [

	actionsSelectorPresenter := anObject
]

{ #category : #initialization }
PackageFormulasScripterUI >> initialExtent [

	^ 700 @ 600
]

{ #category : #initialization }
PackageFormulasScripterUI >> initializeActionSelectorPresenter [
		
	actionsSelectorPresenter := PackageFormulasScriptActionsTree new.
		
]

{ #category : #initialization }
PackageFormulasScripterUI >> initializeLayout [

	self layout: (SpBoxLayout newLeftToRight 
		spacing: 2;
		add: #actionsSelectorPresenter height: 20;
		add: (SpBoxLayout newTopToBottom
			spacing: 2;
			add: #preActionsLabel height: self labelHeight;
			add: #preActionsPresenter height: 50;

			add: #installActionLabel height: self labelHeight;
			add: #scriptPresenter;

			add: #postActionsLabel height: self labelHeight;
			add: #postActionsPresenter height: 50;
			yourself);
		yourself)
]

{ #category : #initialization }
PackageFormulasScripterUI >> initializePresenters [

	self 
		initializeActionSelectorPresenter;
		initializeScriptPresenters;
		initializeLayout

]

{ #category : #initialization }
PackageFormulasScripterUI >> initializeScriptPresenters [
	
	preActionsLabel := self newLabel label: 'Pre-install actions'; yourself.
	preActionsPresenter := self newCode 
		beWrapWord;
		withoutLineNumbers;
		whenSubmitDo: [ : scriptCode | self validateScript: scriptCode ].
	postActionsLabel := self newLabel label: 'Post-install actions'; yourself.
	postActionsPresenter := self newCode 
		beNotEditable;
		beWrapWord;
		withoutLineNumbers.
	installActionLabel := self newLabel label: 'Main installation'; yourself.
	scriptPresenter := self newCode
		beWrapWord;
		withoutLineNumbers;
		whenSubmitDo: [ : scriptCode | self validateScript: scriptCode ].
]

{ #category : #initialization }
PackageFormulasScripterUI >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self title;
		initialExtent: self initialExtent;
		windowIcon: self windowIcon
]

{ #category : #accessing }
PackageFormulasScripterUI >> installScript: aString [

	self scriptPresenter text: aString
]

{ #category : #accessing }
PackageFormulasScripterUI >> postActionsPresenter [

	^ postActionsPresenter
]

{ #category : #accessing }
PackageFormulasScripterUI >> postActionsPresenter: anObject [

	postActionsPresenter := anObject
]

{ #category : #accessing }
PackageFormulasScripterUI >> preActionsPresenter [

	^ preActionsPresenter
]

{ #category : #accessing }
PackageFormulasScripterUI >> preActionsPresenter: anObject [

	preActionsPresenter := anObject
]

{ #category : #accessing }
PackageFormulasScripterUI >> scriptPresenter [

	^ scriptPresenter
]

{ #category : #accessing }
PackageFormulasScripterUI >> scriptPresenter: anObject [

	scriptPresenter := anObject
]

{ #category : #accessing }
PackageFormulasScripterUI >> title [

	^ 'Package Formulas: Install Options'
]

{ #category : #private }
PackageFormulasScripterUI >> toolbarButtons [
	| buttons |

	buttons := OrderedCollection new.
	buttons add: (self newToolbarButton
		 label: 'Install';
		 icon: (self iconNamed: #smallOk);
		 help: 'Install the selected formulas';
		 action: [ self installSelectedFormulas ];
		 yourself).
	buttons add: (self newToolbarButton
		 label: 'Cancel';
		 icon: (self iconNamed: #smallCancel);
		 help: 'Cancel';
		 action: [ self delete ];
		 yourself).
	^ buttons
]

{ #category : #callbacks }
PackageFormulasScripterUI >> validateScript: scriptCode [

	self shouldBeImplemented 
]
