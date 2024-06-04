"
Abstract class to group querying formulas behavior.

Subclasses should re-implement methods to query different API implementations, for example based in Metacello, Pakbot/Cargo, Gofer, etc. Currently these methods are:

- #hasInstallerInstalled
- #hasPackageInstalled
- #parseRepositoryExpression


"
Class {
	#name : 'PFAbstractQuerier',
	#superclass : 'PFAbstractObject',
	#category : 'PackageFormulas-Core',
	#package : 'PackageFormulas',
	#tag : 'Core'
}

{ #category : 'instance creation' }
PFAbstractQuerier class >> findQuerierClass: aPackageFormula [
	"Answer a <PFAbstractQuerier> subclass matching a reference in aPackageFormula definition"

	^ self allSubclasses
		  detect: [ :subClass | subClass matchInstallExpression: aPackageFormula ]
		  ifNone: [ 
			  self error:
				  'Format of package formula invalid or There is no Package Formula suitable for a querier for the expression in: '
				  , aPackageFormula selector ]
]

{ #category : 'instance creation' }
PFAbstractQuerier class >> for: aPackageFormula [
	"Answer an instance of the subclass matching the installation expression found in aPackageFormula"

	^ (self findQuerierClass: aPackageFormula)
		new
		packageFormula: aPackageFormula;
		yourself
]

{ #category : 'instance creation' }
PFAbstractQuerier class >> installerClassName [
	"Answer a <String> with the class name used to install a package (e.g. Gofer, Metacello, etc)"

	self subclassResponsibility
]

{ #category : 'instance creation' }
PFAbstractQuerier class >> matchInstallExpression: aPackageFormula [
	"Answer <true> if the receiver match the installation expression found in aPackageFormula"
	
	^ aPackageFormula ast body references: self installerClassName
]

{ #category : 'testing' }
PFAbstractQuerier >> hasInstallerInstalled [ 

	self subclassResponsibility
]

{ #category : 'testing' }
PFAbstractQuerier >> hasPackageInstalled [
	"Answer <true> if the package specified in the receiver's formula AST is found in the image"
	
	self subclassResponsibility
]

{ #category : 'testing' }
PFAbstractQuerier >> matchPackageName: aString withPackageNamed: aString2 [ 
	"Answer <true> if aString matches aString2"

	^ aString size > aString2 size 
		ifTrue: [ aString asLowercase beginsWith: aString2 asLowercase ]
		ifFalse: [ aString2 asLowercase beginsWith: aString asLowercase ]
]

{ #category : 'parsing' }
PFAbstractQuerier >> parseExpression: aString [
	"Answer a <RBMessageNode> matching the receiver's expected repository expression"

	^ RBParseTreeSearcher
		   treeMatching: aString
		   in: self packageFormulaAst
]

{ #category : 'parsing' }
PFAbstractQuerier >> parseRepositoryExpression [ 
	"Answer a <RBMessageNode> matching the receiver's expected repository: expression"

	self subclassResponsibility
]

{ #category : 'testing' }
PFAbstractQuerier >> repositoryRegistry [
	"Answer a <Collection> of package registries currently installed in this system.
	Reject any potential registry misleading to match other package names beggining with the same name."
	^ IceRepository registry reject: [ : iceRep | iceRep name = 'pharo' ]
]
