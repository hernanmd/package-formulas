Extension { #name : #Pragma }

{ #category : #'*EnvironmentProfiles' }
Pragma class >> allIn: aClass [
	"Answer a <Collection> of <Pragma> found in aClass"
	
	^ aClass methods select: #hasPragma
]

{ #category : #'*EnvironmentProfiles' }
Pragma >> hasFormulaInstalled [
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

{ #category : #'*EnvironmentProfiles' }
Pragma >> installFormula [
	"Execute the receiver's body part assumed to have a Metacello install expression"
	| formulaSelector link |
	
	formulaSelector := self method selector.
	link := MetaLink new
		metaObject: self;
		selector: #wrap:selector:;
		arguments: #(object selector);
		control: #instead.
	(PackageFormulas class >> formulaSelector) ast link: link.
	PackageFormulas perform: formulaSelector
]

{ #category : #'*EnvironmentProfiles' }
Pragma >> recordFormula [

	| metacelloRecordExpression |
	metacelloRecordExpression := (RBParseTreeRewriter 
		replace: '``@anything load' 
		with: '``@anything record' 
		in: self method ast body) formattedCode.
	Smalltalk compiler evaluate: metacelloRecordExpression.
]

{ #category : #'*EnvironmentProfiles' }
Pragma >> webLinkHome [
	"Answer a <String> representing the home page URL of the receiver's formula"

	| urlString url |
	
	urlString := ((RBParseTreeSearcher treeMatching: '``@anything repository: ``@arg1' in: self method ast))
			ifNotNil: [ : args | args arguments anyOne value ]
			ifNil: [ ((RBParseTreeSearcher treeMatching: '``@anything githubUser: ``@arg1 project: ``@arg2 commitish: ``@arg3 path: ``@arg4' in: self method ast) arguments first: 2)
				ifNotNil: [ : args | 'github://' , args first value , '/' , args second value ] ].
	url := urlString asZnUrl.
	^ String streamContents: [ : stream |
		stream
			<< 'https://github.com/';
			<< url authority;
			<< '/';
			<< (url directory copyUpTo: $:) ]
]

{ #category : #'*EnvironmentProfiles' }
Pragma >> wrap: aClass selector: aSelector [

	| formulaExpression |
	formulaExpression := String streamContents: [ : stream |
		stream
			<< 'EpMonitor disableDuring: [ ';
			<< 	(aClass class >> aSelector) ast body sourceCode;
			<< ' ].' ].
	Smalltalk compiler evaluate: formulaExpression.
]
