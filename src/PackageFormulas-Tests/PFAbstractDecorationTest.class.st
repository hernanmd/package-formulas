Class {
	#name : 'PFAbstractDecorationTest',
	#superclass : 'PackageFormulasAbstractTest',
	#instVars : [
		'decorator'
	],
	#category : 'PackageFormulas-Tests-Decorator',
	#package : 'PackageFormulas-Tests',
	#tag : 'Decorator'
}

{ #category : 'test' }
PFAbstractDecorationTest >> expectedSource [

	^ 'Metacello new
		baseline: ''PackageFormulas'';
		repository: ''github://hernanmd/package-formulas'';
		load.'
]
