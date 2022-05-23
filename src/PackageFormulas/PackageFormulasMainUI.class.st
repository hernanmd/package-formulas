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
		'toolbar'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #accessing }
PackageFormulasMainUI >> categorySelector [

	^ categorySelector
]

{ #category : #accessing }
PackageFormulasMainUI >> formulasTable [

	^ formulasTable
]

{ #category : #initialization }
PackageFormulasMainUI >> initialExtent [
 
	^ 700 @ 600
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
			yourself));
		yourself
]

{ #category : #initialization }
PackageFormulasMainUI >> initializePresenters [

	self 
		initializeToolbar;
		initializeCategorySelector;
		initializeFormulasSelector;
		initializeLayout.

]

{ #category : #initialization }
PackageFormulasMainUI >> initializeToolbar [
	
	toolbar :=self toolbarActions asToolbarPresenterWith: [ :presenter |
		presenter
			displayMode: self application toolbarDisplayMode;
			addStyle: 'stToolbar' ]
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
		register: (PackageFormulasQuitCommand forSpecContext: self);
		yourself
]
