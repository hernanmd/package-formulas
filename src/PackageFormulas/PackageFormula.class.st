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
		'decoration',
		'categories'
	],
	#classVars : [
		'RepositorySchemas'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #'*PackageFormulas' }
PackageFormula class >> allIn: aClass [
	"Answer a <Collection> of <PackageFormula> found in aClass"

	^ (aClass methods select: #hasPragma) collect: #formula
]

{ #category : #'*PackageFormulas' }
PackageFormula class >> allNamed: aSymbol in: aClass [
	"Answer a <Collection> of all package formulas found in methods of aClass whose selector is aSymbol."
	
	^ Array streamContents: [ :stream |
		 aClass formulasDo: [ : formula |
			(formula categories includes: aSymbol)
				ifTrue: [ stream nextPut: formula ] ] ]
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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

{ #category : #'accessing - decorators' }
PackageFormula >> addDecoration: aDecoration [
	"Add aDecoration to the receivers decoration chain. Answer the added decoration."
	
	| previous current |
	previous := nil.
	current := self decoration.
	[ current ~~ self ] whileTrue: [
		previous := current.
		current := current next ].
	aDecoration setNext: current.
	previous
		ifNil: [ self decoration: aDecoration ]
		ifNotNil: [ previous setNext: aDecoration ].
	^ aDecoration
]

{ #category : #private }
PackageFormula >> buildGitHubLink: args [
	"Answer a <String> representing the github link to the receiver's repository"

	^ String streamContents: [ : stream |
		stream 
			<< 'github://';
			<<  args first value;
			<<  $/;
			<< args second value ]
]

{ #category : #private }
PackageFormula >> buildHTTPHomeLink: url [
	"Answer a <String> representing the receiver's home URL address"

	^ String streamContents: [ :stream | 
		  stream
				<< (self urlForScheme: url scheme);
				<< url authority;
				<< $/;
				<< (url directory copyUpTo: $:) ]
]

{ #category : #accessing }
PackageFormula >> categories [

	^ categories
		ifNil: [ categories := OrderedCollection new ]
]

{ #category : #accessing }
PackageFormula >> categories: anObject [

	categories := anObject
]

{ #category : #'accessing - decorators' }
PackageFormula >> decoration [

	^ decoration 
		ifNil: [ decoration := self ]
		ifNotNil: [ decoration contents ]
]

{ #category : #'accessing - decorators' }
PackageFormula >> decoration: aDecoration [
	decoration contents: aDecoration
]

{ #category : #'accessing - decorators' }
PackageFormula >> decorations [
	"Answer an ordered collection of all decorations active in the receiver."
	
	| current result |
	current := self decoration.
	result := OrderedCollection new.
	[ current = self ] whileFalse: [
		result add: current.
		current := current next ].
	^ result
]

{ #category : #testing }
PackageFormula >> hasBaseline [
	"Answer <true> if receiver's method, assumed to be a Metacello install expression, is installed in the receiver"

	| extractedTree baselineName |
	
	extractedTree := RBParseTreeSearcher 
		treeMatching: '``@anything baseline: ``@args' 
		in: self method ast.
	extractedTree ifNotNil: [ 
		baselineName := extractedTree arguments anyOne.
		^ Smalltalk hasClassNamed: 'BaselineOf' , baselineName value ].
	^ false
]

{ #category : #initialization }
PackageFormula >> initialize [

	super initialize.
	decoration := ValueHolder new contents: self
]

{ #category : #accessing }
PackageFormula >> install [
	"Execute the receiver's body part assumed to have a Metacello install expression"
	| formulaSelector ast metaLink |
	
	formulaSelector := self method selector.
	ast := (PackageFormulas class >> formulaSelector) ast.
	metaLink := self decoration installIn: ast.
	PackageFormulas perform: formulaSelector.
	ast removeLink: metaLink.
]

{ #category : #accessing }
PackageFormula >> installIn: anAST [
	"By default we do nothing, if we want additional installation behavior, use one or multiple decorators"

]

{ #category : #testing }
PackageFormula >> isInstalled [
	"Answer <true> if receiver's method, assumed to be a Metacello install expression, is installed in the receiver"

	| extractedTree baselineName |
	
	extractedTree := RBParseTreeSearcher 
		treeMatching: '``@anything baseline: ``@args' 
		in: self method ast.
	extractedTree ifNotNil: [ 
		| pkgRepository |
		baselineName := extractedTree arguments anyOne.
		pkgRepository := IceRepository registry detect: [ : r | r name = baselineName value ] ifNone: [ ^ false ].
		^ pkgRepository loadedPackages anySatisfy: [:aPackage | aPackage name = baselineName value ] ].
	^ false
]

{ #category : #parsing }
PackageFormula >> parseFromGitHubExtendedShortcut [
	"Parse an alternative usage of Metacello install expressions"

	^ ((RBParseTreeSearcher
		    treeMatching: '``@anything githubUser: ``@arg1 project: ``@arg2 commitish: ``@arg3 path: ``@arg4'
		    in: self method ast) arguments first: 2) 
				ifNotNil: [ :args | self buildGitHubLink: args ]
]

{ #category : #parsing }
PackageFormula >> parseRepositoryExpression [
	"Answer a <RBMessageNode> matching the receiver's expected repository: expression"

	^ RBParseTreeSearcher
		  treeMatching: '``@anything repository: ``@arg1'
		  in: self method ast
]

{ #category : #printing }
PackageFormula >> printOn: aStream [

	aStream 
		<< 'Formula: ';
		<< self method asString
]

{ #category : #accessing }
PackageFormula >> record [

	| metacelloRecordExpression |
	metacelloRecordExpression := (RBParseTreeRewriter 
		replace: '``@anything load' 
		with: '``@anything record' 
		in: self method ast body) formattedCode.
	Smalltalk compiler evaluate: metacelloRecordExpression.
]

{ #category : #'accessing - decorators' }
PackageFormula >> removeDecoration: aDecoration [ 
	"Remove aDecoration from the chain of decorations. Answer nil if aDecoration is not present."

	| previous current |
	previous := nil.
	current := self decoration.
	[ current = self ] whileFalse: [
		current = aDecoration ifTrue: [
			previous isNil
				ifTrue: [ self decoration: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aDecoration setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #private }
PackageFormula >> repositorySchemas [ 
	"See class side"
	
	^ self class repositorySchemas
]

{ #category : #private }
PackageFormula >> urlForScheme: aString [ 
	"Answer a <String> representing a valid web address for aString. i.e. Given 'github' get 'https://github.com'"
	
	^ self repositorySchemas at: aString

]

{ #category : #accessing }
PackageFormula >> valueInClass: aClass withSelector: aSelector [
	"Answer a <String> representing a package installation expression as originally provided by a package author"
	
	^ (aClass class >> aSelector) ast body sourceCode
]

{ #category : #accessing }
PackageFormula >> webLinkHome [
	"Answer a <String> representing the home page URL of the receiver's formula"

	| urlString |
	urlString := self parseRepositoryExpression
		             ifNotNil: [ :messageNode | messageNode arguments anyOne value ]
		             ifNil: [ self parseFromGitHubExtendedShortcut ].
	^ self buildHTTPHomeLink: urlString asZnUrl
]

{ #category : #'accessing - cursor' }
PackageFormula >> webLinkIssues [
	
	^ self webLinkHome , '/issues'
]
