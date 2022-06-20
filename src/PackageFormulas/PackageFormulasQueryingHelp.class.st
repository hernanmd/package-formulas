Class {
	#name : #PackageFormulasQueryingHelp,
	#superclass : #PackageFormulasHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #accessing }
PackageFormulasQueryingHelp class >> bookDescription [ 

	^ 'This section describes how to use the Package Formulas API to make queries about formulas. See subsections for details.'
]

{ #category : #accessing }
PackageFormulasQueryingHelp class >> bookName [
	"Return the name of the help book"

	^ 'Queries'
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> exampleAddMultipleWrappers [

	^ '(PackageFormulas @ #neoJson)
		addDecoration: (PackageFormulaBackgroundWrapper new);
		addDecoration: (PackageFormulaDisableMonitorWrapper new);
		addDecoration: (PackageFormulaAfterInstall new sourceCode: ''self inform: ''Finished'');
		yourself'
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> exampleAddWrapper [

	^ '(PackageFormulas for: #IDE) second
 	addDecoration: (PackageFormulaBackgroundWrapper new);
 	install.'
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> exampleInstallScript [

	^ '(PackageFormulas @ #neoJson) install.'
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> exampleListCategories [

	^ '(PackageFormulas @ #neoJson) categories.'
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> headingText [

	^ self heading: 'How to use it as an API'
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> howToUseTheAPI [

	^ HelpTopic 
		title: 'Querying Formulas' 
		contents: self queryFormulasHelp
]

{ #category : #accessing }
PackageFormulasQueryingHelp class >> pages [
	^ #( howToUseTheAPI)
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> queryFormulasHelp [

	^ String streamContents: [ : stream |
		stream 
			<< self headingText;
			<< self queryFormulasHelpContents ]
]

{ #category : #'instance creation' }
PackageFormulasQueryingHelp class >> queryFormulasHelpContents [

	^  'Most of the functionality is intended to be intuitive through the Package Formulas UI, but can also be used through the PackageFormula API. In that case, some examples are:

## Installing a formula

{1}

## Listing categories

{2}

## Add a wrapper and install

{3}

## Add multiple wrappers and install

{4} ' format: { 
	self exampleInstallScript . 
	self exampleListCategories . 
	self exampleAddWrapper . 
	self exampleAddMultipleWrappers  }
]
