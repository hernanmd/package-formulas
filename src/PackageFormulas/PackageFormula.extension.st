Extension { #name : #PackageFormula }

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
