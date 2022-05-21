Extension { #name : #PackageFormula }

{ #category : #'*PackageFormulas' }
PackageFormula class >> allIn: aClass [
	"Answer a <Collection> of receiver's instances found in aClass"

	^ (aClass methods select: #hasPragma) collect: #pragmas
]

{ #category : #'*PackageFormulas' }
PackageFormula class >> allNamed: aSymbol in: aClass [
	"Answer a collection of all pragmas found in methods of aClass whose selector is aSymbol."
	
	^ Array streamContents: [ :stream |
		 aClass formulasDo: [ :pragma |
			pragma selector = aSymbol
				ifTrue: [ stream nextPut: pragma ] ] ]
]
