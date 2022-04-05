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
	(EnvironmentFormulas class >> formulaSelector) ast link: link.
	EnvironmentFormulas perform: formulaSelector
]

{ #category : #'*EnvironmentProfiles' }
Pragma >> webLinkHome [
	"Answer a <String> representing the home page URL of the receiver's formula"

	| litNode url |
	
	litNode := (RBParseTreeSearcher treeMatching: '``@anything repository: ``@arg1' in: self method ast) arguments anyOne.
	url := litNode value asZnUrl.
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
