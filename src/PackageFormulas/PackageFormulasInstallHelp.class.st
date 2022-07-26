Class {
	#name : #PackageFormulasInstallHelp,
	#superclass : #PackageFormulasHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #accessing }
PackageFormulasInstallHelp class >> bookDescription [ 

	^ 'This section describes how to use the Package Formulas API to make queries about formulas. See subsections for details.'
]

{ #category : #accessing }
PackageFormulasInstallHelp class >> bookName [
	"Return the name of the help book"

	^ 'Installing'
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> exampleAddMultipleWrappers [

	^ '(PackageFormulas @ #neoJson)
		addDecoration: (PackageFormulaBackgroundWrapper new);
		addDecoration: (PackageFormulaDisableMonitorWrapper new);
		addDecoration: (PackageFormulaAfterInstall new sourceCode: ''self inform: ''Finished'');
		yourself'
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> exampleAddWrapper [

	^ '(PackageFormulas for: #IDE) second
 	addDecoration: (PackageFormulaBackgroundWrapper new);
 	install.'
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> exampleInstallScript [

	^ '(PackageFormulas @ #neoJson) install.'
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> headingText [

	^ self heading: 'How to use it as an API'
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> howToUseTheAPI [

	^ HelpTopic 
		title: 'Installing Formulas' 
		contents: self installFormulasHelp
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> installFormulasHelp [

	^ String streamContents: [ : stream |
		stream 
			<< self headingText;
			<< self installFormulasHelpContents ]
]

{ #category : #'instance creation' }
PackageFormulasInstallHelp class >> installFormulasHelpContents [

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
PackageFormulasInstallHelp class >> pages [
	^ #( howToUseTheAPI)
]
