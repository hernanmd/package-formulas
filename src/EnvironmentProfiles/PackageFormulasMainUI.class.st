Class {
	#name : #PackageFormulasMainUI,
	#superclass : #SpPresenter,
	#instVars : [
		'categorySelector',
		'formulasTable',
		'toolbar'
	],
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #accessing }
PackageFormulasMainUI >> categorySelector [

	^ categorySelector
]

{ #category : #accessing }
PackageFormulasMainUI >> formulasTable [

	^ formulasTable
]

{ #category : #private }
PackageFormulasMainUI >> generateCategories [
	"Answer a <Collection> of <String> each describing a formula category"
	| foundPragmas |

	foundPragmas := (Pragma allIn: PackageFormulas class) collect: #pragmas.
	^ (foundPragmas 
		flatCollect: [ : pragmaArray | pragmaArray collect: #selector ]
		as: Set) collect: [ : pragmaSelector | pragmaSelector capitalized ]
]

{ #category : #initialization }
PackageFormulasMainUI >> initialExtent [
 
	^ 700 @ 600
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeCategorySelector [

	categorySelector := self newList.
	categorySelector 
		items: self generateCategories asSortedCollection;
		whenSelectionChangedDo: [ self refreshFormulasList ];
		contextMenu: [ self menuMorphForSelectedItems ].
]

{ #category : #initialization }
PackageFormulasMainUI >> initializeFormulasTable [

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
		initializeFormulasTable;
		initializeLayout.

]

{ #category : #initialization }
PackageFormulasMainUI >> initializeToolbar [
	
	toolbar :=self toolbarActions asToolbarPresenterWith: [ :presenter |
		presenter
			displayMode: self application toolbarDisplayMode;
			addStyle: 'stToolbar' ]
]

{ #category : #menu }
PackageFormulasMainUI >> packagesIn: aPackageGroupSymbol [
	"Private - Answer a <Collection> for pacakges categorized in aPackageGroupSymbol"
	
	^ PackageFormulas formulasFor: aPackageGroupSymbol uncapitalized
]

{ #category : #callbacks }
PackageFormulasMainUI >> refreshFormulasList [
	"Private - Category has changed, update the displayed formulas"

	self formulasTable items: (self packagesIn: self categorySelector selectedItem) 
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
		register: (PackageFormulasTestCommand forSpecContext: self);
		register: (PackageFormulasUpdateCommand forSpecContext: self);
		register: (PackageFormulasOptionsCommand forSpecContext: self);				
		register: (PackageFormulasQuitCommand forSpecContext: self);
		yourself
]
