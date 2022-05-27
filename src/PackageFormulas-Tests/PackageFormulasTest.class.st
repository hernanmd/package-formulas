Class {
	#name : #PackageFormulasTest,
	#superclass : #TestCase,
	#instVars : [
		'formulas'
	],
	#category : #'PackageFormulas-Tests'
}

{ #category : #accessing }
PackageFormulasTest >> formulas [

	^ formulas
]

{ #category : #accessing }
PackageFormulasTest >> formulas: anObject [

	formulas := anObject
]

{ #category : #running }
PackageFormulasTest >> setUp [
	
	super setUp.
	formulas := PackageFormulas class organization listAtCategoryNamed: 'formulas'.
]

{ #category : #tests }
PackageFormulasTest >> testFormulasFor [

	| someFormulas |
	
	someFormulas := PackageFormulas for: #general.

	self
		assert: someFormulas notEmpty
		description: 'It tests there are already general package formulas available'.
	
	self
		assert: (someFormulas allSatisfy: [ : each | each isKindOf: PackageFormula ])
		description: 'It tests all retrieved formulas are package formula'
]

{ #category : #tests }
PackageFormulasTest >> testHasFormulas [

	self
		assert: self formulas notEmpty
		description: 'It test that there are formulas already available'.
	
	self
		assert: (self formulas allSatisfy: [ : selector | PackageFormulas class includesSelector: selector ])
		description: 'It test that all formulas are compiled methods'.
		
	self
		assert: ((self formulas collect: [ : selector | PackageFormulas class >> selector ]) allSatisfy: #hasPragma)
		description: 'It test that all formulas includes a pragma'
	
]
