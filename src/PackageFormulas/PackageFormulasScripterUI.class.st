"
Presents options to customize previosuly selected formulas. This presenter builds a ""user formula"" from  the formulas marked for installation in the `PackageFormulasMainUI`.

Possible customizations are:

- Actions before the main installation expressions (those containing `Metacello new`).
- Actions which wrap the installation expressions (these are enclosed by blocks).
- Actions after the installation expressions.

"
Class {
	#name : #PackageFormulasScripterUI,
	#superclass : #SpPackageFormulasPresenter,
	#instVars : [
		'actionsSelectorPresenter',
		'scriptPresenter',
		'installActionLabel',
		'userFormula'
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
		spacing: 3;
		add: #actionsSelectorPresenter width: 200;
		add: (SpBoxLayout newTopToBottom
			spacing: 2;
			add: #installActionLabel height: self labelHeight;
			add: #scriptPresenter;
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
	
	installActionLabel := self newLabel label: 'Installation script'; yourself.
	scriptPresenter := self newCode
		beForScripting;
		beWrapWord;
		withoutLineNumbers;
		text: self wrappedSource;
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
PackageFormulasScripterUI >> installation [
	"If we have more than a single formula selected, then build a custom formula with user selected formulas"

	^ userFormula
]

{ #category : #initialization }
PackageFormulasScripterUI >> newUserFormulaFrom: aFormulaCollection [
	"Answer a new <PackageFormula> including the source from the user selected formulas"

	userFormula := PFSingleInstallation newWithFormulas: aFormulaCollection.
	^ userFormula
]

{ #category : #accessing }
PackageFormulasScripterUI >> postActionsPresenter [

	^ postActionsPresenter
]

{ #category : #accessing }
PackageFormulasScripterUI >> postActionsPresenter: anObject [

	postActionsPresenter := anObject
]

{ #category : #callbacks }
PackageFormulasScripterUI >> postActionsPresenterAddText: aString [

	self postActionsPresenter text: (String streamContents: [ : stream |
		stream
			<< self postActionsPresenter text;
			cr;
			<< aString ]).
]

{ #category : #callbacks }
PackageFormulasScripterUI >> postActionsPresenterSetEmpty [

	self postActionsPresenter text: String empty
]

{ #category : #accessing }
PackageFormulasScripterUI >> preActionsPresenter [

	^ preActionsPresenter
]

{ #category : #accessing }
PackageFormulasScripterUI >> preActionsPresenter: anObject [

	preActionsPresenter := anObject
]

{ #category : #callbacks }
PackageFormulasScripterUI >> preActionsPresenterAddText: aString [

	self preActionsPresenter text: (String streamContents: [ : stream |
		stream
			<< self preActionsPresenter text;
			cr;
			<< aString ]).
]

{ #category : #callbacks }
PackageFormulasScripterUI >> preActionsPresenterSetEmpty [

	self preActionsPresenter text: String empty
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

{ #category : #initialization }
PackageFormulasScripterUI >> wrappedSource [
	"Answer a <String> representing the installation script"

	^ self wrappedSource: userFormula

]

{ #category : #initialization }
PackageFormulasScripterUI >> wrappedSource: aPackageFormula [
	"Answer a <String> representing the installation script"

	actionsSelectorPresenter selectedWrapperActions isEmpty 
		ifFalse: [ ^ aPackageFormula decoration sourceCode ].
	^ aPackageFormula sourceCode
]

{ #category : #callbacks }
PackageFormulasScripterUI >> wrapperActionsPresenterAddText: aString [

	self scriptPresenter text: (String streamContents: [ : stream |
		stream
			<< self scriptPresenter text;
			cr;
			<< aString ]).
]

{ #category : #callbacks }
PackageFormulasScripterUI >> wrapperPresenterSetEmpty [

	self scriptPresenter text: String empty
]

{ #category : #initialization }
PackageFormulasScripterUI >> wrapperPresenterUpdate: aPackageFormula [

	self scriptPresenter text: (self wrappedSource: aPackageFormula).
]
