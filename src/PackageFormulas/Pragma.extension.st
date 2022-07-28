Extension { #name : #Pragma }

{ #category : #'*PackageFormulas' }
Pragma >> isPackageFormula [
	"Answer <true> if the receiver has a formula selector"

	^ self selector = #formula:
]
