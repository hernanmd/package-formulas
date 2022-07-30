"
A PackageFormula represents an installation expression of one or multiple Pharo packages.

A formula can perform the following actions: 

- Answer if it's already installed with #isInstalled.
- Be installed with #install.
- Obtain additional information form its install expression:
  - A `String` representing its web URL home page with #webLinkHome.
  - A `String` url pointing to its issues page with #webLinkIssues.

`PackageFormulas` is used as a default repository of formulas, but any class can store formulas. See class comments in `PackageFormulas` to check how to do it. 

PackageFormula's uses two helper objects to obtain additional information 

- `PackageFormulaInfo` to hold and obtain general information such as its home page, issues page, etc.
- A subclass of `PFAbstractQuerier` dinamically choosen according to the installation expression used.
"
Class {
	#name : #PackageFormula,
	#superclass : #Pragma,
	#instVars : [
		'categories',
		'querier',
		'installation',
		'info'
	],
	#classVars : [
		'RepositorySchemas'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormula class >> initRepositorySchemas [
	"Private - Ideally this could be built using something like:
	IceUrlBuilder new
		protocol: IceHttpsProtocol new;
		beGithub;
		buildUrl."

	^ Dictionary new
		at: 'github' put: 'https://github.com/';
		at: 'gitlab' put: 'https://gitlab.com/';
		at: 'bitbucet' put: 'https://bitbucket.org/';
		yourself
]

{ #category : #'instance creation' }
PackageFormula class >> newFrom: aPragma [
	
	^ self new
		method: aPragma method;
		selector: aPragma selector;
		arguments: aPragma arguments;
		yourself
]

{ #category : #private }
PackageFormula class >> repositorySchemas [
	"Answer a <Dictionary> which maps host names to its web URL"

	^ RepositorySchemas 
		ifNil: [ RepositorySchemas := self initRepositorySchemas ]
]

{ #category : #comparing }
PackageFormula >> <= aPackageFormula [
	"Answer <true> if the receiver's selector comes before aPackageFormula in alphabetically order"
	
	^ self method selector <= aPackageFormula method selector
]

{ #category : #accessing }
PackageFormula >> ast [

	^ self method ast
]

{ #category : #accessing }
PackageFormula >> categories [
	"Answer a <Collection> of <Symbol> representing categories found in the receiver"

	^ categories
		ifNil: [ categories := OrderedCollection new ]
]

{ #category : #accessing }
PackageFormula >> categories: anObject [

	categories := anObject
]

{ #category : #testing }
PackageFormula >> hasInstallerInstalled [
	"Answer <true> if receiver's method, assumed to be a Metacello install expression, is installed in the receiver"

	^ self querier hasInstallerInstalled
]

{ #category : #testing }
PackageFormula >> hasPackageInstalled [
	"Answer <true> if the receiver is installed in the current environment"

	^ self querier hasPackageInstalled
]

{ #category : #accessing }
PackageFormula >> info [
	"Answer a <PackageFormulaInfo>, a helper to provider more information about a formula"

	^ info
		ifNil: [ info := PackageFormulaInfo for: self ]
]

{ #category : #accessing }
PackageFormula >> install [
	"Execute the receiver's assumed to have a Metacello install expression using the default container for formulas"

	PackageFormulas perform: self method selector.

]

{ #category : #accessing }
PackageFormula >> installIn: aSpApplication [
	"Execute the receiver's assumed to have a Metacello install expression using the default container for formulas"

	aSpApplication formulasContainer perform: self method selector.

]

{ #category : #accessing }
PackageFormula >> installation [

	^ installation
]

{ #category : #testing }
PackageFormula >> isInstalled [
	"Answer <true> if the receiver is installed in the current environment"

	^ self querier hasPackageInstalled
]

{ #category : #printing }
PackageFormula >> printOn: aStream [

	aStream 
		<< 'Formula: ';
		<< self method asString
]

{ #category : #accessing }
PackageFormula >> querier [
	"Answer a <PFAbstractQuerier>, a helper to query the receiver"

	^ querier
		ifNil: [ querier := PFAbstractQuerier for: self ]
]

{ #category : #accessing }
PackageFormula >> record [

	| metacelloRecordExpression |
	metacelloRecordExpression := (RBParseTreeRewriter 
		replace: '``@anything load' 
		with: '``@anything record' 
		in: self ast body) formattedCode.
	Smalltalk compiler evaluate: metacelloRecordExpression.
]

{ #category : #private }
PackageFormula >> repositorySchemas [ 
	"See class side"
	
	^ self class repositorySchemas
]

{ #category : #accessing }
PackageFormula >> selector [
	"Answer the selector of the pragma.
	 For a pragma defined as <key1: val1 key2: val2> this will answer #key1:key2:."
	
	^ self method selector
]

{ #category : #accessing }
PackageFormula >> sourceCode [

	^ self ast body sourceCode.
]
