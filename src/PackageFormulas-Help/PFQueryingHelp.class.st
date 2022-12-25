"
Help page to explain how to query package formulas.
"
Class {
	#name : #PFQueryingHelp,
	#superclass : #PackageFormulasHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #accessing }
PFQueryingHelp class >> bookDescription [ 

	^ 'This section describes how to use the Package Formulas API to make queries about formulas. See subsections for details.'
]

{ #category : #accessing }
PFQueryingHelp class >> bookName [
	"Return the name of the help book"

	^ 'Queries'
	
]

{ #category : #accessing }
PFQueryingHelp class >> exampleListCategories [

	^ '(PackageFormulas @ #neoJson) categories.'
]

{ #category : #accessing }
PFQueryingHelp class >> headingText [

	^ self heading: 'How to use it as an API'
]

{ #category : #accessing }
PFQueryingHelp class >> howToUseTheAPI [

	^ HelpTopic 
		title: 'Querying Formulas' 
		contents: self queryFormulasHelp
]

{ #category : #accessing }
PFQueryingHelp class >> pages [
	^ #( howToUseTheAPI)
]

{ #category : #accessing }
PFQueryingHelp class >> queryFormulasHelp [

	^ String streamContents: [ : stream |
		stream 
			<< self headingText;
			<< self queryFormulasHelpContents ]
]

{ #category : #accessing }
PFQueryingHelp class >> queryFormulasHelpContents [

	^  'Most of the functionality is intended to be intuitive through the Package Formulas UI, but can also be used through the PackageFormula API. In that case, some examples are:

## Listing categories

{1}
 ' format: { 
	self exampleListCategories }
]
