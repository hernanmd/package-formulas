"
This is the main Spec2 UI of Pharo's PackageFormulas application.

The container for formulas can be configured through #formulasContainer: setter method.

"
Class {
	#name : #PackageFormulasMainUI,
	#superclass : #SpPackageFormulasPresenter,
	#instVars : [
		'formulasTable',
		'toolbar',
		'statusBar',
		'selectionCount',
		'categoriesPresenter'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #accessing }
PackageFormulasMainUI >> categoriesPresenter [

	^ categoriesPresenter
]

{ #category : #callbacks }
PackageFormulasMainUI >> cleanCategoriesPresenterSelection [

	self categoriesPresenter unselect.
]

{ #category : #'accessing - status bar' }
PackageFormulasMainUI >> decreaseFormulaCount [

	selectionCount >= 1 ifFalse: [ ^ self ].
	selectionCount := selectionCount - 1.
	self updateStatusBar.
]

{ #category : #accessing }
PackageFormulasMainUI >> formulasItems: aCollection [
	"Update the displayed formulas with aCollection"
	
	self formulasTable formulasItems: aCollection
]

{ #category : #accessing }
PackageFormulasMainUI >> formulasTable [

	^ formulasTable
]

{ #category : #accessing }
PackageFormulasMainUI >> hasFormulasInstalled [
	"Answer <true> if the receiver's application includes any of its defined formulas already installed"
	
	^ self application hasFormulasInstalled
	
]

{ #category : #'accessing - status bar' }
PackageFormulasMainUI >> increaseFormulaCount [
	
	selectionCount := selectionCount + 1.
	self updateStatusBar.
]

{ #category : #initialization }
PackageFormulasMainUI >> initialExtent [
 
	^ 700 @ 600
]

{ #category : #initialization }
PackageFormulasMainUI >> initialize [

	super initialize.
	selectionCount := 0.
	statusBar pushMessage: self statusBarMessage.
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeCategorySelector [

	categoriesPresenter := self instantiate: PackageFormulasCategoriesUI.
	categoriesPresenter application: self application.
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
			add: #categoriesPresenter;
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

{ #category : #'accessing - status bar' }
PackageFormulasMainUI >> popMessage [

	statusBar popMessage
]

{ #category : #accessing }
PackageFormulasMainUI >> selectedCategory [ 
	"Answer a <Symbol> representing the currently selected category"

	^ self categoriesPresenter selectedCategory 
]

{ #category : #accessing }
PackageFormulasMainUI >> selectedFormulas [
	"Answer a <Collection> of formulas marked for installation"
	
	^ self formulasTable selectedFormulas
]

{ #category : #'accessing - status bar' }
PackageFormulasMainUI >> statusBarMessage [

	| listedFormulasCount |
	
	listedFormulasCount := self selectedCategory 
		ifNil: [ 0 ]
		ifNotNil: [ (self application formulasInCategory: self selectedCategory) size ].
	^ '{1} formulas, {2} listed, {3} to install, {4} installed' 
		format: { 
			(self application formulas size) .
			listedFormulasCount .
			selectionCount .
			self application installedFormulas size }
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
		register: (PackageFormulasInstallOptionsCommand forSpecContext: self);
		register: (PackageFormulasViewInstalledCommand forSpecContext: self);
		register: (PackageFormulasUpdateCommand forSpecContext: self);
		register: (PackageFormulasHelpCommand forSpecContext: self);			
		register: (PackageFormulasQuitCommand forSpecContext: self);
		yourself
]

{ #category : #'accessing - status bar' }
PackageFormulasMainUI >> updateStatusBar [

	statusBar pushMessage: self statusBarMessage.
]

{ #category : #callbacks }
PackageFormulasMainUI >> updateWithFormulasIn: aString [ 
	"Private - Refresh the selectable formulas in the receiver's formulas selector"
	
	self formulasTable updateWithFormulasIn: aString
]
