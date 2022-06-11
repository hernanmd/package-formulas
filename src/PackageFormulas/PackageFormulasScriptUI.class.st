Class {
	#name : #PackageFormulasScriptUI,
	#superclass : #SpPresenter,
	#instVars : [
		'preActionsPresenter',
		'scriptPresenter',
		'postActionsPresenter'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #'instance creation' }
PackageFormulasScriptUI class >> open [
	<script>

	^ self new openModalWithSpec
]

{ #category : #initialization }
PackageFormulasScriptUI >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom
		spacing: 2;
		add: #preActionsPresenter height: 50;
		add: #scriptPresenter;
		add: #postActionsPresenter height: 50;
		yourself)
]

{ #category : #initialization }
PackageFormulasScriptUI >> initializePresenters [

	self 
		initializeScriptPresenters;
		initializeLayout

]

{ #category : #initialization }
PackageFormulasScriptUI >> initializeScriptPresenters [
		
	preActionsPresenter := self newCode 
		beWrapWord;
		withoutLineNumbers;
		whenSubmitDo: [ : scriptCode | self validateScript: scriptCode ].
	postActionsPresenter := self newCode 
		beNotEditable;
		beWrapWord;
		withoutLineNumbers.
	scriptPresenter := self newCode
		beWrapWord;
		withoutLineNumbers;
		whenSubmitDo: [ : scriptCode | self validateScript: scriptCode ].		
]

{ #category : #accessing }
PackageFormulasScriptUI >> installScript: aString [

	self scriptPresenter text: aString
]

{ #category : #accessing }
PackageFormulasScriptUI >> postActionsPresenter [

	^ postActionsPresenter
]

{ #category : #accessing }
PackageFormulasScriptUI >> postActionsPresenter: anObject [

	postActionsPresenter := anObject
]

{ #category : #accessing }
PackageFormulasScriptUI >> preActionsPresenter [

	^ preActionsPresenter
]

{ #category : #accessing }
PackageFormulasScriptUI >> preActionsPresenter: anObject [

	preActionsPresenter := anObject
]

{ #category : #accessing }
PackageFormulasScriptUI >> scriptPresenter [

	^ scriptPresenter
]

{ #category : #accessing }
PackageFormulasScriptUI >> scriptPresenter: anObject [

	scriptPresenter := anObject
]

{ #category : #accessing }
PackageFormulasScriptUI >> title [

	^ 'Package Formulas: Install Options'
]

{ #category : #private }
PackageFormulasScriptUI >> toolbarButtons [
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
PackageFormulasScriptUI >> validateScript: scriptCode [

	self shouldBeImplemented 
]
