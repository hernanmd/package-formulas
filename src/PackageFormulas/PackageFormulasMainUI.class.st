"
This is the main Spec2 UI of Pharo's PackageFormulas application.

The container for formulas can be configured through #formulasContainer: setter method.

"
Class {
	#name : #PackageFormulasMainUI,
	#superclass : #SpPresenter,
	#instVars : [
		'categorySelector',
		'formulasTable',
		'toolbar',
		'statusBar',
		'selectionCount'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #accessing }
PackageFormulasMainUI >> categorySelector [

	^ categorySelector
]

{ #category : #accessing }
PackageFormulasMainUI >> decreaseFormulaCount [

	selectionCount >= 1 ifFalse: [ ^ self ].
	selectionCount := selectionCount - 1.
	statusBar pushMessage: ('Packages to install: {1}' format: { selectionCount })
]

{ #category : #accessing }
PackageFormulasMainUI >> formulasTable [

	^ formulasTable
]

{ #category : #accessing }
PackageFormulasMainUI >> increaseFormulaCount [
	
	selectionCount := selectionCount + 1.
	statusBar pushMessage: ('Packages to install: {1}' format: { selectionCount })
]

{ #category : #initialization }
PackageFormulasMainUI >> initialExtent [
 
	^ 700 @ 600
]

{ #category : #initialization }
PackageFormulasMainUI >> initialize [

	super initialize.
	selectionCount := 0
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeCategorySelector [

	categorySelector := self instantiate: PackageFormulasCategoriesUI.
	categorySelector application: self application.
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeFormulasSelector [

	formulasTable := self instantiate: PackageFormulasSelectorUI.
	formulasTable application: self application.
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeLayout [

	self layout: (SpBoxLayout newTopToBottom 
		add: #toolbar height: self class toolbarHeight + 10;
		add: (SpPanedLayout newLeftToRight
			positionOfSlider: 30 percent;
			add: #categorySelector;
			add: #formulasTable;
			yourself);
		add: #statusBar height: SpToolbarMorph statusBarHeight);
		yourself
]

{ #category : #initialization }
PackageFormulasMainUI >> initializePresenters [

	self 
		initializeToolbar;
		initializeStatusbar;
		initializeCategorySelector;
		initializeFormulasSelector;
		initializeLayout

]

{ #category : #initialization }
PackageFormulasMainUI >> initializeStatusbar [

	statusBar := SpStatusBarPresenter new
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeToolbar [
	
	toolbar :=self toolbarActions asToolbarPresenterWith: [ :presenter |
		presenter
			displayMode: self application toolbarDisplayMode;
			addStyle: 'stToolbar' ]
]

{ #category : #accessing }
PackageFormulasMainUI >> popMessage [

	statusBar popMessage
]

{ #category : #callbacks }
PackageFormulasMainUI >> refreshFormulasSelector: aString [ 
	"Private - Refresh the selectable formulas in the receiver's formulas selector"
	
	self formulasTable refreshFormulasSelector: aString
]

{ #category : #accessing }
PackageFormulasMainUI >> selectedFormulas [
	"Answer a <Collection> of formulas marked for installation"
	
	^ self formulasTable selectedFormulas
]

{ #category : #initialization }
PackageFormulasMainUI >> title [ 

	^ 'Package Formulas'
]

{ #category : #accessing }
PackageFormulasMainUI >> toolbar [

	^ toolbar
]

{ #category : #initialization }
PackageFormulasMainUI >> toolbarActions [

	^ (CmCommandGroup named: 'EPToolbar') asSpecGroup 
		beRoot;
		description: 'Commands related to toolbar operations and global application behavior';
		register: (PackageFormulasInstallCommand forSpecContext: self);
		register: (PackageFormulasBrowseCommand forSpecContext: self);
		register: (PackageFormulasRecordCommand forSpecContext: self);
		register: (PackageFormulasUpdateCommand forSpecContext: self);
		register: (PackageFormulasOptionsCommand forSpecContext: self);
		register: (PackageFormulasHelpCommand forSpecContext: self);			
		register: (PackageFormulasQuitCommand forSpecContext: self);
		yourself
]
