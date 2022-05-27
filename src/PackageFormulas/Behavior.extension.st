Extension { #name : #Behavior }

{ #category : #'*PackageFormulas' }
Behavior >> formulas [
	"Answer a <Collection> of <PackageFormula> found in the receiver"

	^ self methods 
		select: #hasPackageFormula
		thenCollect: #formula.

]

{ #category : #'*PackageFormulas' }
Behavior >> formulasDo: aFullBlockClosure [ 
	"Evaluate aFullBlockClosure for each of the receiver's method formula"

	self formulas do: [ : f | aFullBlockClosure value: f ]
]
