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
	^ 'Package Formulas'
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
Package Formulas is a front-end for installing packages on a Pharo image. Each formula describes an installation. An installation contains one or multiple categories, along with a Pharo expression. Package Formulas does not assume any particular install manager, it could be Gofer, Metacello or a Pakbot expression.

The default formulas are found in the PackageFormulas class (on the class side), but nothing prevents you from defining your own formula container for your own packages.

In case you want to have your own packages listed in the application, you can simply request a Formula using the Request menu option from the contextual menu in a category'
]

{ #category : #'instance creation' }
PackageFormulasHelp class >> pages [
	^ #(intro)
]
