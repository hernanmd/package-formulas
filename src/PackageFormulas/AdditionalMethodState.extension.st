Extension { #name : #AdditionalMethodState }

{ #category : #'*PackageFormulas' }
AdditionalMethodState >> formula [
	"Answer a <PackageFormula> if found in the receiver"

	1 to: self basicSize do: [ : i | 
		| propertyOrPragma	|
		propertyOrPragma := self basicAt: i.
		propertyOrPragma isAssociation
			ifFalse: [ 
				^ PackageFormula new
					method: propertyOrPragma method;
					yourself ] ]
]

{ #category : #'*PackageFormulas' }
AdditionalMethodState >> formulaCategories [
	"Answer a <Collection> of <Symbol> each representing a package formula category found in the receiver"

	^ self pragmas 
		select: [ : pragma | pragma selector = 'formula:' ]
		thenCollect: [ : pragma | pragma arguments first ].

]

{ #category : #'*PackageFormulas' }
AdditionalMethodState >> formulasDo: aFullBlockClosure [ 

	aFullBlockClosure value: self formula
]

{ #category : #'*PackageFormulas' }
AdditionalMethodState >> isPackageFormula [
	"Answer <true> if the receiver contains any package formula"
	
	^ self method hasPragmas and: [ self pragmas anySatisfy: #isPackageFormula ]
]
