Class {
	#name : #PackageFormulaInfo,
	#superclass : #Object,
	#instVars : [
		'packageFormula'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #'instance creation' }
PackageFormulaInfo class >> for: aPackageFormula [

	^ self new
		packageFormula: aPackageFormula;
		yourself
]

{ #category : #private }
PackageFormulaInfo >> buildGitHubLink: args [
	"Answer a <String> representing the github link to the receiver's repository"

	^ String streamContents: [ : stream |
		stream 
			<< 'github://';
			<<  args first value;
			<<  $/;
			<< args second value ]
]

{ #category : #private }
PackageFormulaInfo >> buildHTTPHomeLink: url [
	"Answer a <String> representing the receiver's home URL address"

	^ String streamContents: [ :stream | 
		  stream
				<< (self urlForSchema: url scheme);
				<< url authority;
				<< $/;
				<< (url directory copyUpTo: $:) ]
]

{ #category : #accessing }
PackageFormulaInfo >> packageFormula [

	^ packageFormula
]

{ #category : #accessing }
PackageFormulaInfo >> packageFormula: anObject [

	packageFormula := anObject
]

{ #category : #parsing }
PackageFormulaInfo >> packageFormulaAst [

	^ self packageFormula ast
]

{ #category : #parsing }
PackageFormulaInfo >> parseFromGitHubExtendedShortcut [
	"Parse an alternative usage of Metacello install expressions"

	^ ((RBParseTreeSearcher
		    treeMatching: '``@anything githubUser: ``@arg1 project: ``@arg2 commitish: ``@arg3 path: ``@arg4'
		    in: self packageFormulaAst) arguments first: 2) 
				ifNotNil: [ :args | self buildGitHubLink: args ]
]

{ #category : #parsing }
PackageFormulaInfo >> parseRepositoryExpression [
	"Answer a <RBMessageNode> matching the receiver's expected repository: expression"

	^ RBParseTreeSearcher
		  treeMatching: '``@anything repository: ``@arg1'
		  in: self packageFormulaAst
]

{ #category : #private }
PackageFormulaInfo >> urlForSchema: aString [ 
	"Answer a <String> representing a valid web address for aString. i.e. Given 'github' get 'https://github.com'"
	
	^ self packageFormula repositorySchemas at: aString

]

{ #category : #accessing }
PackageFormulaInfo >> webLinkHome [
	"Answer a <String> representing the home page URL of the receiver's formula"

	| urlString |
	urlString := self parseRepositoryExpression
		             ifNotNil: [ :messageNode | messageNode arguments anyOne value ]
		             ifNil: [ self parseFromGitHubExtendedShortcut ].
	^ self buildHTTPHomeLink: urlString asZnUrl
]

{ #category : #'accessing - cursor' }
PackageFormulaInfo >> webLinkIssues [
	
	^ self webLinkHome , '/issues'
]
