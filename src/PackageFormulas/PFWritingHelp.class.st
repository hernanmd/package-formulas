Class {
	#name : #PFWritingHelp,
	#superclass : #PackageFormulasHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #accessing }
PFWritingHelp class >> bookDescription [ 

	^ 'This section describes how to write a simple Package Formula. See subsections for details.'
]

{ #category : #accessing }
PFWritingHelp class >> bookName [
	"Return the name of the help book"

	^ 'Writing a Formula'
]

{ #category : #'instance creation' }
PFWritingHelp class >> exampleBasicFormula [

	^ 'myCoolPackage
	<formula: #blockchain>
	
	Metacello new
		repository: '''';
		baseline: ...;
		load
'
]

{ #category : #'instance creation' }
PFWritingHelp class >> exampleMultipleCategoriesFormula [

	^ 'myCoolFormula
	
	<formula: #GIS>
 	<formula: #science>
	
 	Metacello new
 		baseline: ''''MyCoolProject'''';
 		repository: ''''github://...'''';
 		load'
]

{ #category : #'instance creation' }
PFWritingHelp class >> headingText [

	^ self heading: 'Writing a formula'
]

{ #category : #accessing }
PFWritingHelp class >> pages [
	^ #(writingAFormula)
]

{ #category : #'instance creation' }
PFWritingHelp class >> writingAFormula [

	^ HelpTopic 
		title: self headingText
		contents: self writingFormulasHelpContents
]

{ #category : #'instance creation' }
PFWritingHelp class >> writingFormulasHelpContents [

	^ '
A formula can be written by defining a pragma and the installation expression, for example:

{1}

The default place to compile a formula is the class PackageFormulas (class side). This class acts as a "repository" of package formulas, although any class can be configured to be used  as a repository. Compiling the method will make the formula visible to the Package Formulas UI tool, which by default uses the PackageFormulas class.

There is no need to return anything, nor to define additional installation tasks as many of them can be handled by the Package Formulas installed.

A formula can belong to multiple categories, like this:

{2}

and it will be listed in both categories of the Package Formulas UI.
' format: { 
	self exampleBasicFormula .
	self exampleMultipleCategoriesFormula }
]
