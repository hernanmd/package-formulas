Class {
	#name : #PackageFormulasRecordCommand,
	#superclass : #PackageFormulasToolbarCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulasRecordCommand class >> defaultDescription [

	^ 'Record installation of selected formulas'
]

{ #category : #'accessing - defaults' }
PackageFormulasRecordCommand class >> defaultIconName [

	^ #testGreen
]

{ #category : #'accessing - defaults' }
PackageFormulasRecordCommand class >> defaultName [

	^ 'Record'
]

{ #category : #execution }
PackageFormulasRecordCommand >> execute [
	"Test installation of selected formulas"

	self selectedFormulas do: [ : formula | formula record ]
]
