Extension { #name : #AdditionalMethodState }

{ #category : #'*PackageFormulas' }
AdditionalMethodState >> formulasDo: aFullBlockClosure [ 
	
	1 to: self basicSize do: [ :i | 
		| propertyOrPragma	"<Association|Pragma>" |
		propertyOrPragma := self basicAt: i.
		propertyOrPragma isAssociation
			ifFalse: [ aFullBlockClosure value: (PackageFormula newFrom: propertyOrPragma) ] ]
]
