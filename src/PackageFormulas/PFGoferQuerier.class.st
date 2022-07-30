Class {
	#name : #PFGoferQuerier,
	#superclass : #PFAbstractQuerier,
	#category : #'PackageFormulas-Core'
}

{ #category : #'instance creation' }
PFGoferQuerier class >> installerClassName [
	"See superimplementor's comment"

	^ 'Gofer'
]

{ #category : #testing }
PFGoferQuerier >> hasInstallerInstalled [

	^ self hasPackageInstalled.
]

{ #category : #testing }
PFGoferQuerier >> hasPackageInstalled [
	"Answer <true> if the package specified in anAST is found in the image"
	
	^ self searchByConfigurationName: self packageFormulaAst
]

{ #category : #accessing }
PFGoferQuerier >> searchByConfigurationName: aRBMethodNode [ 
	"Assume for now package it contains the String 'ConfigurationOf<package-name>'"
	| extractedTree |
	
	extractedTree := RBParseTreeSearcher
		                 treeMatching: '``@anything package: ``@args'
		                 in: aRBMethodNode.
	extractedTree ifNotNil: [ :arg | 
		| pkgRepository configName |
		configName := extractedTree arguments anyOne.
		pkgRepository := IceRepository registry
			                 detect: [ :r | 
			                 self
				                 matchPackageName: r name
				                 withPackageNamed: (configName value copyAfter: 'ConfigurationOf') ]
			                 ifNone: [ ^ false ].
		^ pkgRepository loadedPackages notEmpty ].
	^ false
]
