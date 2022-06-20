"
Help book for Package Formulas

"
Class {
	#name : #PackageFormulasHelp,
	#superclass : #CustomHelp2,
	#category : #'PackageFormulas-Help'
}

{ #category : #'accessing - pages' }
PackageFormulasHelp class >> bookDescription [
	^ 'Package Formulas is a front-end for installing packages on a Pharo image. Each package is specified in a formula.

In its most basic form, a PackageFormula is simply a CompiledMethod that includes a Pragma identified by the name "formula:", and an argument specifying a category.

For example, the following method defines a PackageFormula in the "general" category, intended for packages with generic functionality:

````smalltalk
method
	<formula: #general>
```

This way no more is needed to define a PackageFormula, except to add the package installation code. This will usually be a Metacello expression, such as you can see in any README.md of project repositories in Pharo.

Most packages are actually in the PackageFormulas class (on the class side), but nothing prevents you from defining your own formula container for your own packages.

In case you want to have your own packages listed in the application, you can simply clone this repository, add your "package formulas" methods (i.e. with the pragma and the installation expression), and then send a Pull Request.'
]

{ #category : #accessing }
PackageFormulasHelp class >> bookName [
	"Return the name of the help book"

	^ 'Package Formulas'
]

{ #category : #'accessing - pages' }
PackageFormulasHelp class >> intro [

	^ HelpTopic 
		title: self bookName
		contents: self packageFormulasIntro
]

{ #category : #'instance creation' }
PackageFormulasHelp class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #'accessing - pages' }
PackageFormulasHelp class >> packageFormulasIntro [

	^ String streamContents: [ : stream | 
		stream
			<< (self heading: 'Introduction');
			<< self packageFormulasIntroText ]
]

{ #category : #'accessing - pages' }
PackageFormulasHelp class >> packageFormulasIntroText [ 
		
		^ '
Package Formulas is a front-end for installing packages on a Pharo image. Each package is specified in a formula.

In its most basic form, a PackageFormula is simply a CompiledMethod that includes a Pragma identified by the name "formula:", and an argument specifying a category.

For example, the following method defines a PackageFormula in the "general" category, intended for packages with generic functionality:

method
	<formula: #general>

This way no more is needed to define a PackageFormula, except to add the package installation code. This will usually be a Metacello expression, such as you can see in any README.md of project repositories in Pharo.

Most packages are actually in the PackageFormulas class (on the class side), but nothing prevents you from defining your own formula container for your own packages.

In case you want to have your own packages listed in the application, you can simply clone this repository, add your "package formulas" methods (i.e. with the pragma and the installation expression), and then send a Pull Request.'
]

{ #category : #'instance creation' }
PackageFormulasHelp class >> pages [
	^ #(intro)
]
