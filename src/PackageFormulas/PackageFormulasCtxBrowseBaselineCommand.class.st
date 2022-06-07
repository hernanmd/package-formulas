Class {
	#name : #PackageFormulasCtxBrowseBaselineCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseBaselineCommand class >> defaultDescription [

	^ 'Browse selected formula''s Baseline code'
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseBaselineCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #'accessing - defaults' }
PackageFormulasCtxBrowseBaselineCommand class >> defaultName [

	^ 'Browse Baseline'
]

{ #category : #executing }
PackageFormulasCtxBrowseBaselineCommand >> canBeExecuted [ 

	^ (self application 
		propertyAt: #formulaSelection 
		ifAbsent: [ ^ false ]) hasBaseline.
]

{ #category : #executing }
PackageFormulasCtxBrowseBaselineCommand >> execute [
	"Private - Inspect the selected pragma"

	| method |
	
	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	method := (self application propertyAt: #formulaSelection) method.
	self querier packageFormula: method.
	self querier baselineName
		ifNotEmpty: [ : baselineName |
			self stBrowser
				openOnClass: ('BaselineOf' , baselineName) asClass
				selector: #baseline: ]


]
