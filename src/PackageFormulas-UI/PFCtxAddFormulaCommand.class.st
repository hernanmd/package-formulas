Class {
	#name : #PFCtxAddFormulaCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFCtxAddFormulaCommand class >> defaultDescription [

	^ 'Add a formula in this category'
]

{ #category : #initialization }
PFCtxAddFormulaCommand class >> defaultIconName [

	^ #add
]

{ #category : #default }
PFCtxAddFormulaCommand class >> defaultName [

	^ 'Add Formula'
]

{ #category : #executing }
PFCtxAddFormulaCommand >> execute [
	"Open a browser with a template for a new formula"

	| answer |
	answer := UIManager default request:
		          'Formula name (must have a valid selector format)'.
	(answer isEmptyOrNil or: [ answer isValidSelector not ]) 
		ifTrue: [ ^ self ].
	(RBAddMethodChange 
		compile: (self 
				newFormulaNamed: answer
				category: self selectedFormulaMethodCategories) 
		in: self formulasContainer class
		classified: 'formulas') execute.
	self stBrowser openOnClass: self formulasContainer class selector: answer asSymbol.
	self formulasTable refresh
]

{ #category : #accessing }
PFCtxAddFormulaCommand >> newFormulaNamed: aString category: formulaCategoriesString [ 

	^ String streamContents: [ : stream |
		stream
			<< aString;
			crtab;
			<< formulaCategoriesString;
			crtab;
			<< self newFormulaTemplate ]
]

{ #category : #accessing }
PFCtxAddFormulaCommand >> newFormulaTemplate [

	^ 'Metacello new
		baseline: ''YourBaselineName'';
		repository: ''github://your-username/your-repository/src'';
		load'
]

{ #category : #accessing }
PFCtxAddFormulaCommand >> selectedFormulaMethodCategories [
	"Answer a <String> representation of the selected method formula categories"
	
	^ self selectedFormulaMethod pragmas 
		joinUsing: Character cr
]
