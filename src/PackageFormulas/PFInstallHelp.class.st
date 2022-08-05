"
Main page for package-formulas help.

"
Class {
	#name : #PFInstallHelp,
	#superclass : #PackageFormulasHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #'accessing - pages' }
PFInstallHelp class >> bookDescription [ 

	^ 'This section describes how to use the Package Formulas API to make queries about formulas. See subsections for details.'
]

{ #category : #accessing }
PFInstallHelp class >> bookName [
	"Return the name of the help book"

	^ 'Installing'
]

{ #category : #'instance creation' }
PFInstallHelp class >> exampleAddMultipleWrappers [

	^ '(PackageFormulas @ #neoJson)
		addDecoration: (PFBackgroundWrapper new);
		addDecoration: (PFDisableMonitorWrapper new);
		addDecoration: (PFPostInstallDecoration new sourceCode: ''self inform: ''Finished'');
		yourself'
]

{ #category : #'instance creation' }
PFInstallHelp class >> exampleAddWrapper [

	^ '(PackageFormulas for: #IDE) second
 	addDecoration: (PFBackgroundWrapper new);
 	install.'
]

{ #category : #'instance creation' }
PFInstallHelp class >> exampleInstallScript [

	^ '(PackageFormulas @ #neoJson) install.'
]

{ #category : #'instance creation' }
PFInstallHelp class >> headingText [

	^ self heading: 'How to use it as an API'
]

{ #category : #'instance creation' }
PFInstallHelp class >> howToUseTheAPI [

	^ HelpTopic 
		title: 'Installing Formulas' 
		contents: self installFormulasHelp
]

{ #category : #'instance creation' }
PFInstallHelp class >> installFormulasHelp [

	^ String streamContents: [ : stream |
		stream 
			<< self headingText;
			<< self installFormulasHelpContents ]
]

{ #category : #'instance creation' }
PFInstallHelp class >> installFormulasHelpContents [

	^  '# Install a Formula
	
{1}

# Add a wrapper and install

{2}

# Add multiple wrappers and install

{3} ' format: { 
	self exampleInstallScript . 
	self exampleAddWrapper . 
	self exampleAddMultipleWrappers  }
]

{ #category : #accessing }
PFInstallHelp class >> pages [
	^ #( howToUseTheAPI)
]
