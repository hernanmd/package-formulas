"
Help book for Package Formulas

"
Class {
	#name : #PackageFormulasHelp,
	#superclass : #CustomHelp,
	#category : #'PackageFormulas-Help'
}

{ #category : #accessing }
PackageFormulasHelp class >> bookName [
	"Return the name of the help book"

	^ 'Package Formulas'
]

{ #category : #'accessing - pages' }
PackageFormulasHelp class >> intro [
	^ HelpTopic 
		title: self bookName
		contents: (self heading: 'Package Formulas'),
		'This application is a front-end for installing packages on a Pharo image. Each package is specified in a formula.

In its most basic form, a PackageFormula is simply a CompiledMethod that includes a Pragma identified by the name "formula:" and an argument specifying a category.

For example, the following method defines a PackageFormula in the "general" category, intended for packages with generic functionality:

````smalltalk
method
	<formula: #general>
```

This way no more is needed to define a PackageFormula, except to add the package installation code. This will usually be a Metacello expression, such as you can see in any README.md of project repositories in Pharo.

Most packages are actually in the PackageFormulas class (on the class side), but nothing prevents you from defining your own formula container for your own packages.

In case you want to have your own packages listed in the application, you can simply clone this repository, add your "package formulas" methods (i.e. with the pragma and the installation expression), and then send a Pull Request.


# Writing a formula

A formula can belong to several categories, like this:

````smalltalk

```

Installation Options

- Save image after install.
- Log execution
- Background installation.
- Simulate loading.

Details

The idea is that most of the functionality is intuitive through the Package Formulas UI, but can also be used through the PackageFormula API.

The UI tries to be simple in the sense that it provides the categories, the list of formulas for each category, and the main operations accessible through checkboxes, toolbars and context menus with the available operations enabled according to the selected formula.

In case you want to use the API, some examples are:

````smalltalk
(PackageFormulas @ #neoJson) install.
```

Formulas support multiple categories:

```smalltalk
(PackageFormulas @ #neoJson) categories.
```

```smalltalk
(PackageFormulas for: #IDE) second
	addDecoration: (PackageFormulaBackgroundWrapper new);
	install.
```

(PackageFormulas @ #neoJson)
	addDecoration: (PackageFormulaBackgroundWrapper new);
	addDecoration: (PackageFormulaDisableMonitorWrapper new);
	addDecoration: (PackageFormulaAfterInstall new sourceCode: ''self inform: ''''Fin'''''');
	yourself
'
]

{ #category : #'instance creation' }
PackageFormulasHelp class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #'instance creation' }
PackageFormulasHelp class >> pages [
	^ #(intro )
]
