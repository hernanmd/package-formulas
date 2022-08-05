"
Command to open a code browser on the selected formula Baseline class (if installed).
"
Class {
	#name : #PFCtxBrowseBaselineCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFCtxBrowseBaselineCommand class >> defaultDescription [

	^ 'Browse selected formula''s Baseline code'
]

{ #category : #initialization }
PFCtxBrowseBaselineCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #default }
PFCtxBrowseBaselineCommand class >> defaultName [

	^ 'Browse Baseline'
]

{ #category : #testing }
PFCtxBrowseBaselineCommand >> canBeExecuted [ 

	^ (self application 
		propertyAt: #formulaSelection 
		ifAbsent: [ ^ false ]) hasInstallerInstalled.
]

{ #category : #executing }
PFCtxBrowseBaselineCommand >> execute [
	"Private - Inspect the selected pragma"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	self querier definitionName
		ifNotEmpty: [ : baselineName |
			self stBrowser
				openOnClass: (self class environment at: ('BaselineOf' , baselineName) asSymbol)
				selector: #baseline: ]
		ifEmpty: [ self inform: 'Baseline name not found!' ]


]
