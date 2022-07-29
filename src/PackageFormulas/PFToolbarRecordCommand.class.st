Class {
	#name : #PFToolbarRecordCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFToolbarRecordCommand class >> defaultDescription [

	^ 'Record installation of selected formulas'
]

{ #category : #'accessing - defaults' }
PFToolbarRecordCommand class >> defaultIconName [

	^ #testGreen
]

{ #category : #'accessing - defaults' }
PFToolbarRecordCommand class >> defaultName [

	^ 'Record'
]

{ #category : #execution }
PFToolbarRecordCommand >> execute [
	"Test installation of selected formulas"

	self selectedFormulas do: [ : formula | formula record ]
]
