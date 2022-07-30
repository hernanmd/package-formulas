Class {
	#name : #PFRecordCommand,
	#superclass : #PFToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PFRecordCommand class >> defaultDescription [

	^ 'Record installation of selected formulas'
]

{ #category : #'accessing - defaults' }
PFRecordCommand class >> defaultIconName [

	^ #testGreen
]

{ #category : #'accessing - defaults' }
PFRecordCommand class >> defaultName [

	^ 'Record'
]

{ #category : #executing }
PFRecordCommand >> execute [
	"Test installation of selected formulas"

	self selectedFormulas do: [ : formula | formula record ]
]
