Class {
	#name : 'PackageFormulaInfoTest',
	#superclass : 'PackageFormulasAbstractTest',
	#instVars : [
		'packageFormulaInfoGofer',
		'packageFormulaInfoEmpty',
		'packageFormulaInfo',
		'packageFormulaInfoAlt',
		'packageFormulaInfoWithBranchName'
	],
	#category : 'PackageFormulas-Tests-Core',
	#package : 'PackageFormulas-Tests',
	#tag : 'Core'
}

{ #category : 'accessing' }
PackageFormulaInfoTest >> packageFormulaInfo [
	" Answer the packageFormulaInfo of this PackageFormulaInfoTest "

	^ packageFormulaInfo
]

{ #category : 'accessing' }
PackageFormulaInfoTest >> packageFormulaInfo: anObject [
	" Sets the packageFormulaInfo of this PackageFormulaInfoTest "

	packageFormulaInfo := anObject
]

{ #category : 'running' }
PackageFormulaInfoTest >> setUp [

	super setUp.
	packageFormulaInfo := PackageFormulaInfo for: self newMockPackageFormula.
	packageFormulaInfoEmpty := PackageFormulaInfo for: self newMockEmptyPackageFormula.
	packageFormulaInfoAlt := PackageFormulaInfo for: self newMockPackageFormulaAlt.
	packageFormulaInfoGofer := PackageFormulaInfo for: self newMockPackageFormulaGofer.
	packageFormulaInfoWithBranchName := PackageFormulaInfo for: self newMockPackageFormulaWithBranchName.
]

{ #category : 'running' }
PackageFormulaInfoTest >> testBuildGitHubLink [

	| repositoryArgument |
	
	repositoryArgument := #('hernanmd' 'package-formulas').
	self assert: ((packageFormulaInfo buildGitHubLink: String empty) isKindOf: String).
	self assert: ((packageFormulaInfo buildGitHubLink: 'af549722-81a1-0d00-84f6-175a03781e9b') isKindOf: String).
	self 
		assert: (packageFormulaInfo buildGitHubLink: repositoryArgument) 
		equals: 'github://hernanmd/package-formulas'.
		
	repositoryArgument := #('pharo-contributions' 'Artefact').
	self
		assert: (packageFormulaInfoAlt buildGitHubLink: repositoryArgument)
		equals: 'github://pharo-contributions/Artefact'
]

{ #category : 'running' }
PackageFormulaInfoTest >> testBuildHTTPHomeLink [

	self 
		should: [ packageFormulaInfo buildHTTPHomeLink: '3bc0cd22-81a1-0d00-a392-b3c103957a0c' ]
		raise: MessageNotUnderstood.
	self 
		should: [ packageFormulaInfo buildHTTPHomeLink: String empty ]
		raise: MessageNotUnderstood.

	self 
		assert: (packageFormulaInfo buildHTTPHomeLink:  'github://hernanmd/package-formulas' asZnUrl)
		equals: 'https://github.com/hernanmd/package-formulas'.
	self 
		assert: (packageFormulaInfo buildHTTPHomeLink:  'gitlab://hernanmd/package-formulas' asZnUrl)
		equals: 'https://gitlab.com/hernanmd/package-formulas'.
	self 
		should: [ packageFormulaInfo buildHTTPHomeLink: 'http://github.com/hernanmd/package-formulas' asZnUrl ]
		raise: KeyNotFound.
	self
		assert: (packageFormulaInfoAlt buildHTTPHomeLink: 'github://pharo-contributions/Artefact' asZnUrl)
		equals: 'https://github.com/pharo-contributions/Artefact'.
	self
		should: [ packageFormulaInfoAlt buildHTTPHomeLink: 'github//pharo-contributions/Artefact' asZnUrl ]
		raise: KeyNotFound.

]

{ #category : 'tests' }
PackageFormulaInfoTest >> testIsBroken [

	self deny: packageFormulaInfo isBroken.
	packageFormulaInfo broken: true.
	self assert: packageFormulaInfo isBroken.
]

{ #category : 'running' }
PackageFormulaInfoTest >> testParseRepositoryExpression [

	self 
		should: [ packageFormulaInfoEmpty parseRepositoryExpression ]
		raise: Error.
		
	self 
		assert: ((packageFormulaInfo parseRepositoryExpression) isKindOf: RBMessageNode).

]

{ #category : 'running' }
PackageFormulaInfoTest >> testParseRepositoryHomeAlt [

	self 
		should: [ packageFormulaInfo parseRepositoryHomeAlt ] 
		raise: Error.
		
	self 
		should: [ packageFormulaInfoEmpty parseRepositoryHomeAlt ] 
		raise: Error.
		
	self assert: (packageFormulaInfoAlt parseRepositoryHomeAlt isKindOf: Collection).
	self 
		assert: packageFormulaInfoAlt parseRepositoryHomeAlt 
		equals: 'github://pharo-contributions/Artefact'.
]

{ #category : 'running' }
PackageFormulaInfoTest >> testQuerier [

	self assert: (packageFormulaInfo querier isKindOf: PFAbstractQuerier).
	self assert: (packageFormulaInfo querier isKindOf: PFMetacelloQuerier).

	self assert: (packageFormulaInfoGofer querier isKindOf: PFGoferQuerier).
	
]

{ #category : 'running' }
PackageFormulaInfoTest >> testUrlForSchema [

	self 
		should: [ packageFormulaInfo urlForSchema: String empty ]
		raise: KeyNotFound.
	self 
		should: [ packageFormulaInfo urlForSchema: 'c8eb8522' ]
		raise: KeyNotFound.

	self 
		assert: (packageFormulaInfo urlForSchema: 'github') 
		equals: 'https://github.com/'.

	self 
		assert: (packageFormulaInfo urlForSchema: 'gitlab') 
		equals: 'https://gitlab.com/'.

	
]

{ #category : 'tests' }
PackageFormulaInfoTest >> testUrlForSegment [

	self 
		assert: (packageFormulaInfo urlForSegment: 'hernanmd/package-formulas:master') 
		equals: 'hernanmd/package-formulas'.
	
	self
		assert: (packageFormulaInfo urlForSegment: 'hernanmd/package-formulas') 
		equals: 'hernanmd/package-formulas'.
	
	self
		assert: (packageFormulaInfo urlForSegment: 'hernanmd') 
		equals: 'hernanmd'.
		
	self
		should: [ packageFormulaInfo urlForSegment: String empty ] 
		raise: SubscriptOutOfBounds
]

{ #category : 'running' }
PackageFormulaInfoTest >> testWebLinkHome [

	self assert: (packageFormulaInfo webLinkHome isKindOf: String).
	self
		assert: packageFormulaInfo webLinkHome
		equals: 'https://github.com/hernanmd/package-formulas'.
	self
		should: [ packageFormulaInfoEmpty webLinkHome ]
		raise: Error.
	self
		assert: packageFormulaInfoGofer webLinkHome
		equals: 'https://github.com/grpistoia/Mathemagics'.
	self
		assert: packageFormulaInfoAlt webLinkHome 
		equals: 'https://github.com/pharo-contributions/Artefact'.
	self
		assert: packageFormulaInfoWithBranchName webLinkHome 
		equals: 'https://github.com/hernanmd/package-formulas'.
]

{ #category : 'running' }
PackageFormulaInfoTest >> testWebLinkIssues [

	self assert: (packageFormulaInfo webLinkIssues isKindOf: String).

]
