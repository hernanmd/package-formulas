"
Helper object to access `PackageFormula` additional information such as:

- Its web home URL.
- Its issues URL address.
- Health status (broken installation).

"
Class {
	#name : #PackageFormulaInfo,
	#superclass : #PFAbstractObject,
	#instVars : [
		'broken'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #'instance creation' }
PackageFormulaInfo class >> for: aPackageFormula [

	^ self new
		packageFormula: aPackageFormula;
		yourself
]

{ #category : #accessing }
PackageFormulaInfo >> broken: aBoolean [
	"Set the receiver's formula as non-working"

	broken := aBoolean
]

{ #category : #private }
PackageFormulaInfo >> buildGitHubLink: aCollection [
	"Answer a <String> representing the github link to the receiver's repository.
	If aCollection is empty, answer an empty <String>"

	aCollection ifEmpty: [ ^ String empty ].
	^ String streamContents: [ : stream |
		stream 
			<< 'github://';
			<<  aCollection first value;
			<<  $/;
			<< aCollection second value ]
]

{ #category : #private }
PackageFormulaInfo >> buildHTTPHomeLink: url [
	"Answer a <String> representing the receiver's home URL address"

	^ String streamContents: [ :stream | 
		  stream
				<< (self urlForSchema: url scheme);
				<< url authority;
				<< $/;
				 << url firstPathSegment ]
]

{ #category : #initialization }
PackageFormulaInfo >> initialize [

	super initialize.
	broken := false.
]

{ #category : #testing }
PackageFormulaInfo >> isBroken [
	"Answer <true> if the receiver is marked as broken"
	
	^ broken
]

{ #category : #parsing }
PackageFormulaInfo >> parseRepositoryExpression [
	"Answer a <RBMessageNode> matching the receiver's expected repository: expression"

	^ self querier parseRepositoryExpression
]

{ #category : #parsing }
PackageFormulaInfo >> parseRepositoryHomeAlt [
	"Answer a <Collection>. Parse an alternative usage of Metacello install expressions"

	^ self querier parseRepositoryAltExpression ifNotNil: [ :args | 
		  self buildGitHubLink: args ]
]

{ #category : #parsing }
PackageFormulaInfo >> querier [
	"Answer the receive's <PFAbstractQuerier>"

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
	"Answer a <String> representing the URL to report issues"

	^ self webLinkHome , '/issues'
]
