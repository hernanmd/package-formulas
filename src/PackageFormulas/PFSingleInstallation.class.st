Class {
	#name : #PFSingleInstallation,
	#superclass : #PFInstallationComponent,
	#category : #'PackageFormulas-Decorator'
}

{ #category : #'instance creation' }
PFSingleInstallation class >> newWithFormulas: aCollection [

	^ self new
		usingFormulas: aCollection;
		yourself
]

{ #category : #private }
PFSingleInstallation >> formattedSourceFor: formula [
	"Answer a <String> formatted with an ending dot"

	| sourceText |
	
	^ ((sourceText := formula sourceCode) endsWith: '.')
		  ifFalse: [ sourceText , '.' ]
		  ifTrue: [ sourceText ]
]

{ #category : #'instance creation' }
PFSingleInstallation >> sourceCodeFrom: aFormulaCollection [

	^ aFormulaCollection collect: [ : formula | self formattedSourceFor: formula ]
]

{ #category : #'instance creation' }
PFSingleInstallation >> usingFormulas: aFormulaCollection [

	self sourceCode: ((self sourceCodeFrom: aFormulaCollection) joinUsing: Character cr).
]
