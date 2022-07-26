Class {
	#name : #PFSingleInstallation,
	#superclass : #PFInstallationComponent,
	#instVars : [
		'sourceCode'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #'instance creation' }
PFSingleInstallation class >> newWithFormulas: aCollection [

	^ self new
		usingFormulas: aCollection;
		yourself
]

{ #category : #private }
PFSingleInstallation >> formattedSourceFor: formula [

	| sourceText |
	
	^ ((sourceText := formula sourceCode) endsWithSubCollection: '.')
		  ifFalse: [ sourceText , '.' ]
		  ifTrue: [ sourceText ]
]

{ #category : #private }
PFSingleInstallation >> install [

	self halt.
	Smalltalk compiler evaluate: self sourceCode.
]

{ #category : #initialization }
PFSingleInstallation >> selector [

	^ #tempUserPackageFormula

]

{ #category : #accessing }
PFSingleInstallation >> sourceCode [

	self halt.
	^ sourceCode
]

{ #category : #accessing }
PFSingleInstallation >> sourceCode: aString [

	sourceCode := aString
]

{ #category : #'instance creation' }
PFSingleInstallation >> sourceCodeFrom: aFormulaCollection [

	^ aFormulaCollection collect: [ : formula | self formattedSourceFor: formula ]
]

{ #category : #'instance creation' }
PFSingleInstallation >> usingFormulas: aFormulaCollection [

	self sourceCode: ((self sourceCodeFrom: aFormulaCollection) joinUsing: Character cr).
]
