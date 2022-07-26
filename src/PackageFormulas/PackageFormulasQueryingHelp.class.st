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

## Listing categories

{1}
 ' format: { 
	self exampleListCategories }
]
