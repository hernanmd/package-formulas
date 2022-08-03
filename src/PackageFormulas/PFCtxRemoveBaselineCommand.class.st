"
This command will remove the selected BaselineOf package from the system.
"
Class {
	#name : #PFCtxRemoveBaselineCommand,
	#superclass : #PFContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFCtxRemoveBaselineCommand class >> defaultDescription [

	^ 'Remove the Baseline of the selected formula'
]

{ #category : #initialization }
PFCtxRemoveBaselineCommand class >> defaultIconName [

	^ #smallDelete
]

{ #category : #'accessing - defaults' }
PFCtxRemoveBaselineCommand class >> defaultName [

	^ 'Remove Baselinee'
]

{ #category : #testing }
PFCtxRemoveBaselineCommand >> canBeExecuted [ 

	^ (self application 
		propertyAt: #formulaSelection 
		ifAbsent: [ ^ false ]) hasInstallerInstalled.
]

{ #category : #executing }
PFCtxRemoveBaselineCommand >> execute [
	"Parse the selected formula and open issues page"

	self application propertyAt: #formulaSelection ifAbsent: [ ^ self ].
	self querier definitionName
		ifNotEmpty: [ : baselineName |
			(self confirm: 'Are you sure to delete the Baseline of: ' , baselineName asString)
				ifTrue: [ (self class environment at: ('BaselineOf' , baselineName) asSymbol) removeFromSystem ] ]
		ifEmpty: [ self inform: 'Baseline name not found!' ]
]
