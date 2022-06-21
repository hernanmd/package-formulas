"
Enables to perform queries to a PackageFormula. Each package formula contains a piece of source code representing the installation of a Pharo Package.

"
Class {
	#name : #PackageFormulaQuerier,
	#superclass : #Object,
	#instVars : [
		'packageFormula'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #baselines }
PackageFormulaQuerier >> baselineName [
	"Answer a <String> with the name of the receiver's baseline. i.e.: 'BaselineOfXXX'
	Answer an empty <String> if formula does not have a Baseline name"
	
	^ (RBParseTreeSearcher
		  treeMatching: '``@anything baseline: ``@arg1'
		  in: self packageFormula ast) arguments
			ifEmpty: [ self inform: 'Formula has no Baseline arguments' ]
			ifNotEmpty: [ : args | args first value ]
]

{ #category : #private }
PackageFormulaQuerier >> handlePackageNotFound: aNotFound [ 
	"Answer the first package matching aNotFound signaler"

	| pkgName |
	pkgName := aNotFound signaler withoutNumbers asLowercase.
	RPackageOrganizer default packagesDo: [ : p |
		(p name asLowercase beginsWith: pkgName)
			ifTrue: [ ^ p ] ].
	NotFound signal: aNotFound signaler.

]

{ #category : #testing }
PackageFormulaQuerier >> isPackageInstalled: anAST [

	| extractedTree baselineName |
	
	extractedTree := RBParseTreeSearcher 
		treeMatching: '``@anything baseline: ``@args' 
		in: anAST.
	extractedTree ifNotNil: [ 
		| pkgRepository |

		baselineName := extractedTree arguments anyOne.
		pkgRepository := IceRepository registry 
			detect: [ : r | self matchPackageName: r name and: baselineName value ] 
			ifNone: [ ^ false ].
		^ pkgRepository loadedPackages notEmpty ].
	^ false
]

{ #category : #testing }
PackageFormulaQuerier >> matchLoadedPackageName: aString and: aString2 [ 
	"Answer <true> if aString and aString2 represents the same package"

	| pkgName |
	pkgName := aString2 asLowercase.
	"Let's remove version numbers from name (e.g.: Seaside3)"
	aString2 findNumbers ifNotEmpty: [ pkgName := aString2 withoutNumbers ].

	^ aString size > pkgName size 
		ifTrue: [ aString asLowercase beginsWith: pkgName ]
		ifFalse: [ pkgName beginsWith: aString asLowercase ]
]

{ #category : #testing }
PackageFormulaQuerier >> matchPackageName: aString and: aString2 [ 

	^ aString size > aString2 size 
		ifTrue: [ aString asLowercase beginsWith: aString2 asLowercase ]
		ifFalse: [ aString2 asLowercase beginsWith: aString asLowercase ]
]

{ #category : #baselines }
PackageFormulaQuerier >> package [
	"Answer the <RPackage> of the receiver's package name"
	
	^ [ self baselineName asPackage ]
	on: NotFound 
	do: [ : ex | self handlePackageNotFound: ex ]
]

{ #category : #accessing }
PackageFormulaQuerier >> packageFormula [

	^ packageFormula
]

{ #category : #accessing }
PackageFormulaQuerier >> packageFormula: anObject [

	packageFormula := anObject
]
