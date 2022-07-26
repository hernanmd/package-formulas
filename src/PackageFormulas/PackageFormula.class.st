"
A PackageFormula represents an installation expression of one or multiple Pharo packages.

A formula can perform the following actions: 

- Answer if it's already installed #isInstalled.
- Ask to be installed with #install.
- Perform a #record as in `Metacello>>record`.
- Obtain a `String` representing its web URL home page with #webLinkHome.

`PackageFormulas` is used as a default repository of formulas, but any class can store formulas, and pass its class name as parameter of the #allIn: method. This will answer the formulas as they only need to have a pragma in the method. 

To use another class to store the formulas, subclass this class and add the methods in the class side.

The rules for naming formula's categories through pragmas are as follows:

- If the category represents an acronym, it must be all uppercase: FIFA, UN, MERCOSUR, etc.
- If the category is a common name, it must be all lowercase, no capitalization.
- If the category has two or more words, they must be separated by the Character $_
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
PackageFormula >> hasBaselineInstalled [
	"Answer <true> if receiver's method, assumed to be a Metacello install expression, is installed in the receiver"

	^ self querier hasBaselineInstalled
]

{ #category : #testing }
PackageFormula >> hasPackageInstalled [
	"Answer <true> if the receiver is installed in the current environment"

	^ self querier hasPackageInstalled
]

{ #category : #accessing }
PackageFormula >> info [

	^ info
		ifNil: [ info := PackageFormulaInfo for: self ]
]

{ #category : #accessing }
PackageFormula >> install [
	"Execute the receiver's body part assumed to have a Metacello install expression"

	self halt.
	PackageFormulas perform: self method selector.

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

	^ querier
		ifNil: [ querier := PackageFormulaQuerier for: self ]
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
