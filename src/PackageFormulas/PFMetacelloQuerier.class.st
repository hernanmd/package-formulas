"
Provides an interface to query a `PackageFormula`, specifically for formulas containing `Metacello` expressions.
"
Class {
	#name : 'PFMetacelloQuerier',
	#superclass : 'PFAbstractQuerier',
	#category : 'PackageFormulas-Core',
	#package : 'PackageFormulas',
	#tag : 'Core'
}

{ #category : 'instance creation' }
PFMetacelloQuerier class >> installerClassName [
	"See superimplementor's comment"

	^ 'Metacello'
]

{ #category : 'baselines' }
PFMetacelloQuerier >> definitionName [
	"Answer a <String> with the name of the receiver matching its baseline pattern. i.e.: 'BaselineOfXXX'
	Answer an empty <String> if formula does not have a Baseline name"
	
	^ self parseBaselineExpression
		ifNil: [ String empty ]
		ifNotNil: [ : ast | ast arguments
			ifEmpty: [ 
				self inform: 'Formula has no Baseline arguments'. 
				String empty ]
			ifNotEmpty: [ : args | args first value ] ]
]

{ #category : 'private' }
PFMetacelloQuerier >> handlePackageNotFound: aNotFound [ 
	"Answer the first package matching aNotFound signaler"

	| pkgName |
	pkgName := aNotFound signaler withoutNumbers asLowercase.
	self pharoPackageOrganizer default packagesDo: [ : p |
		(p name asLowercase beginsWith: pkgName)
			ifTrue: [ ^ p ] ].
	self inform: 'A package was found but no source code seems to be available for this package: ' , aNotFound signaler.

]

{ #category : 'testing' }
PFMetacelloQuerier >> hasInstallerInstalled [
	"Answer <true> if receiver's method, assumed to be a Metacello install expression, is installed in the receiver"

	self parseBaselineExpression ifNotNil: [ : extractedTree |
		| baselineName | 
		baselineName := extractedTree arguments anyOne.
		^ Smalltalk hasClassNamed: 'BaselineOf' , baselineName value ].
	^ false
]

{ #category : 'testing' }
PFMetacelloQuerier >> hasPackageInstalled [
	"Answer <true> if the package specified in anAST is found in the image"

	self parseRepositoryExpression
		ifNotNil: [ : extractedTree | 
			^ self prvHasPackageInstalled or: [ self hasPackageWithRepositoryAddress: extractedTree arguments anyOne ] ].
	^ false

]

{ #category : 'testing' }
PFMetacelloQuerier >> hasPackageWithRepositoryAddress: aRBLiteralValueNode [

	| pkgRepository |
	pkgRepository := self repositoryRegistry
		                 detect: [ :r | 
			                 self
				                 matchPackageName: r name
				                 withRepository: aRBLiteralValueNode value ]
		                 ifNone: [ ^ false ].
	^ pkgRepository loadedPackages notEmpty
]

{ #category : 'testing' }
PFMetacelloQuerier >> hasRPackageNamed: aString [

	| pkgRepository |
	pkgRepository := self repositoryRegistry
		                 detect: [ :r | self matchPackageName: aString and: r name ]
		                 ifNone: [ ^ false ].
	^ pkgRepository loadedPackages notEmpty
]

{ #category : 'testing' }
PFMetacelloQuerier >> matchPackageName: aString and: aString2 [ 

	^ aString size > aString2 size 
		ifTrue: [ aString asLowercase beginsWith: aString2 asLowercase ]
		ifFalse: [ aString2 asLowercase beginsWith: aString asLowercase ]
]

{ #category : 'testing' }
PFMetacelloQuerier >> matchPackageName: pkgNameString withRepository: repositorySpecString [

	| pkgNameInRepositorySpec |
	pkgNameInRepositorySpec := (repositorySpecString substrings: '/') third.
	^ pkgNameString asLowercase = pkgNameInRepositorySpec asLowercase
]

{ #category : 'baselines' }
PFMetacelloQuerier >> package [
	"Answer the <RPackage> of the receiver's package name"
	
	^ [ self definitionName asPackage ]
	on: NotFound 
	do: [ : ex | self handlePackageNotFound: ex ]
]

{ #category : 'testing' }
PFMetacelloQuerier >> packageOrganizerItems [

	| organizerClass |
	
	organizerClass := (SystemVersion current major between: 10 and: 12)
		ifTrue: [ #RPackageOrganizer ]
		ifFalse: [ SystemVersion current major >= 13 
			ifTrue: [ #PackageOrganizer ] ].
	^ organizerClass
		ifNotNil: [ (Smalltalk at: organizerClass) default packages ]
		ifNil: [ (Smalltalk at: #SystemOrganizer) default categories ]
]

{ #category : 'testing' }
PFMetacelloQuerier >> parseBaselineExpression [
	"Answer a <RBMessageNode> matching the receiver's expected repository expression"

	^ self parseExpression: '``@anything baseline: ``@args'

]

{ #category : 'parsing' }
PFMetacelloQuerier >> parseRepositoryAltExpression [
	"Answer a <Collection> with the receiver's repository expression parametersT"

	^ (self parseExpression: '``@anything githubUser: ``@arg1 project: ``@arg2 commitish: ``@arg3 path: ``@arg4') 
			arguments first: 2
]

{ #category : 'parsing' }
PFMetacelloQuerier >> parseRepositoryExpression [ 
	"Answer a <RBMessageNode> matching the receiver's expected repository: expression"

	^ self parseExpression: '``@anything repository: ``@arg1'

]

{ #category : 'accessing' }
PFMetacelloQuerier >> pharoPackageOrganizer [

	| organizerClass |
	
	organizerClass := (SystemVersion current major between: 10 and: 12)
		ifTrue: [ #RPackageOrganizer ]
		ifFalse: [ SystemVersion current major >= 13 
			ifTrue: [ #PackageOrganizer ] ].
	^ organizerClass
		ifNotNil: [ (Smalltalk at: organizerClass) ]
		ifNil: [ (Smalltalk at: #SystemOrganizer) ]
]

{ #category : 'testing' }
PFMetacelloQuerier >> prvHasCategoryNamed: aString [ 
	"Answer <true> if aString matches a System category"

	| pkgs |
	(pkgs := self packageOrganizerItems) anyOne isString
		ifFalse: [ pkgs := pkgs collect: #name ].
	^ pkgs anySatisfy: [ : cat | self matchPackageName: aString and: cat ]
]

{ #category : 'testing' }
PFMetacelloQuerier >> prvHasPackageInstalled [

	| pkgNode |
	
	pkgNode := self parseBaselineExpression arguments anyOne value.
	^ (self prvHasCategoryNamed: pkgNode) or: [ self hasRPackageNamed: pkgNode ]


]
