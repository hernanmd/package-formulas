Class {
	#name : #UserPackageFormula,
	#superclass : #PackageFormula,
	#instVars : [
		'sourceCode'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
UserPackageFormula >> formattedSourceFor: formula [

	| sourceText |
	
	^ ((sourceText := formula sourceCode) endsWithSubCollection: '.')
		  ifFalse: [ sourceText , '.' ]
		  ifTrue: [ sourceText ]
]

{ #category : #initialization }
UserPackageFormula >> selector [

	^ #tempUserPackageFormula

]

{ #category : #accessing }
UserPackageFormula >> sourceCode [

	^ sourceCode
]

{ #category : #accessing }
UserPackageFormula >> sourceCode: aString [

	sourceCode := aString
]

{ #category : #accessing }
UserPackageFormula >> sourceCodeFrom: aFormulaCollection [ 

	^ self sourceCode: ((aFormulaCollection collect: [ : formula | self formattedSourceFor: formula ]) joinUsing: Character cr).
]

{ #category : #private }
UserPackageFormula >> valueInClass: aClass withSelector: aSelector [
	"Answer a <String> representing a package installation expression as originally provided by a package author"
	
	^ self sourceCode
]
