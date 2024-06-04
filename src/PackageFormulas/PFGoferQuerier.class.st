"
Provides an interface to query a `PackageFormula`, specifically for formulas containing `Gofer` expressions.
"
Class {
	#name : 'PFGoferQuerier',
	#superclass : 'PFAbstractQuerier',
	#category : 'PackageFormulas-Core',
	#package : 'PackageFormulas',
	#tag : 'Core'
}

{ #category : 'instance creation' }
PFGoferQuerier class >> installerClassName [
	"See superimplementor's comment"

	^ 'Gofer'
]

{ #category : 'accessing' }
PFGoferQuerier >> hasConfigurationName: aRBMethodNode [

	"Assume for now package it contains the String 'ConfigurationOf<package-name>'"

	| extractedTree |
	extractedTree := RBParseTreeSearcher
		                 treeMatching: '``@anything package: ``@args'
		                 in: aRBMethodNode.
	extractedTree ifNotNil: [ :arg | 
		| pkgRepository configName |
		configName := extractedTree arguments anyOne.
		pkgRepository := self repositoryRegistry
			                 detect: [ :r | 
				                 self
					                 matchPackageName: r name
					                 withPackageNamed:
					                 (configName value copyAfter: 'ConfigurationOf') ]
			                 ifNone: [ ^ false ].
		^ pkgRepository loadedPackages notEmpty ].
	^ false
]

{ #category : 'testing' }
PFGoferQuerier >> hasInstallerInstalled [

	^ self hasPackageInstalled.
]

{ #category : 'testing' }
PFGoferQuerier >> hasPackageInstalled [
	"Answer <true> if the package specified in anAST is found in the image"
	
	^ self hasConfigurationName: self packageFormulaAst
]

{ #category : 'parsing' }
PFGoferQuerier >> parseRepositoryExpression [ 
	"Answer a <RBMessageNode> matching the receiver's expected repository: expression"

	^ self parseExpression: '``@anything url: ``@arg1'

]
