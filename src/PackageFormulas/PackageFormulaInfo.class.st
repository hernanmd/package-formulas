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
PackageFormulaInfo >> parseRepositoryExpression [

	^ self querier parseRepositoryExpression
]

{ #category : #parsing }
PackageFormulaInfo >> parseRepositoryHomeAlt [
	"Parse an alternative usage of Metacello install expressions"

	^ self querier parseRepositoryAltExpression ifNotNil: [ :args | 
		  self buildGitHubLink: args ]
]

{ #category : #parsing }
PackageFormulaInfo >> querier [

	^ self packageFormula querier
]

{ #category : #private }
PackageFormulaInfo >> urlForSchema: aString [ 
	"Answer a <String> representing a valid web address for aString. i.e. Given 'github' get 'https://github.com'"

	^ self packageFormula repositorySchemas 
		at: aString


]

{ #category : #accessing }
PackageFormulaInfo >> webLinkHome [
	"Answer a <String> representing the home page URL of the receiver's formula"

	| urlString |
	urlString := self parseRepositoryExpression
		             ifNotNil: [ :messageNode | messageNode arguments anyOne value ]
		             ifNil: [ self parseRepositoryHomeAlt ].
	^ (urlString beginsWithAnyOf: #('http' 'file' 'tonel'))
		ifTrue: [ urlString ]
		ifFalse: [ self buildHTTPHomeLink: urlString asZnUrl ]
]

{ #category : #'accessing - cursor' }
PackageFormulaInfo >> webLinkIssues [
	
	^ self webLinkHome , '/issues'
]
