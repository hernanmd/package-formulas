"
Enables to perform queries to a PackageFormula. Each package formula contains a piece of source code representing the installation of a Pharo Package.

"
Class {
	#name : #PackageFormulaBaselineQuerier,
	#superclass : #Object,
	#instVars : [
		'packageFormula'
	],
	#category : #'PackageFormulas-Core'
}

{ #category : #baselines }
PackageFormulaBaselineQuerier >> baselineName [
	"Answer a <String> with the name of the receiver's baseline. i.e.: 'BaselineOfXXX'
	Answer an empty <String> if formula does not have a Baseline name"
	
	^ (RBParseTreeSearcher
		  treeMatching: '``@anything baseline: ``@arg1'
		  in: self packageFormula ast) arguments
			ifEmpty: [ self inform: 'Formula has no Baseline arguments' ]
			ifNotEmpty: [ : args | args first value ]
]

{ #category : #accessing }
PackageFormulaBaselineQuerier >> packageFormula [

	^ packageFormula
]

{ #category : #accessing }
PackageFormulaBaselineQuerier >> packageFormula: anObject [

	packageFormula := anObject
]
