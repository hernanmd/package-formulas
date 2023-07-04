Extension { #name : #PFMetacelloQuerier }

{ #category : #'*PackageFormulas-Pharo11' }
PFMetacelloQuerier >> prvHasCategoryNamed: aString [ 
	"Answer <true> if aString matches a System category"

	^ RPackageOrganizer default categories anySatisfy: [ : cat |
		self matchPackageName: aString and: cat ]


]
