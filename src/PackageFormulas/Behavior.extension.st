Extension { #name : #Behavior }

{ #category : #'*PackageFormulas' }
Behavior >> formulasDo: aFullBlockClosure [ 

	self methodsDo: [ : method | method formulasDo: aFullBlockClosure ]
]
