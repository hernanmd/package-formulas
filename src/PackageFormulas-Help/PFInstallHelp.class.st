Class {
	#name : #PFInstallHelp,
	#superclass : #PackageFormulasHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #accessing }
PFInstallHelp class >> bookDescription [ 

	^ 'This section describes how to use the Package Formulas API to make queries about formulas. See subsections for details.'
]

{ #category : #accessing }
PFInstallHelp class >> bookName [
	"Return the name of the help book"

	^ 'Installing'
]

{ #category : #accessing }
PFInstallHelp class >> exampleAddMultipleWrappers [

	^ '(PackageFormulas @ #neoJson)
		addDecoration: (PFBackgroundWrapper new);
		addDecoration: (PFDisableMonitorWrapper new);
		addDecoration: (PFPostInstallDecoration new sourceCode: ''self inform: ''Finished'');
		yourself'
]

{ #category : #accessing }
PFInstallHelp class >> exampleAddWrapper [

	^ '(PackageFormulas for: #IDE) second
 	addDecoration: (PFBackgroundWrapper new);
 	install.'
]

{ #category : #accessing }
PFInstallHelp class >> exampleInstallScript [

	^ '(PackageFormulas @ #neoJson) install.'
]

{ #category : #accessing }
PFInstallHelp class >> headingText [

	^ self heading: 'How to use it as an API'
]

{ #category : #accessing }
PFInstallHelp class >> howToUseTheAPI [

	^ HelpTopic 
		title: 'Installing Formulas' 
		contents: self installFormulasHelp
]

{ #category : #accessing }
PFInstallHelp class >> installFormulasHelp [

	^ String streamContents: [ : stream |
		stream 
			<< self headingText;
			<< self installFormulasHelpContents ]
]

{ #category : #accessing }
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
