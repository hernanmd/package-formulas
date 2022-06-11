Class {
	#name : #PackageFormulaManageCommand,
	#superclass : #PackageFormulasContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #'accessing - defaults' }
PackageFormulaManageCommand class >> defaultDescription [

	^ 'Open packages manager browser for this repository'
]

{ #category : #'accessing - defaults' }
PackageFormulaManageCommand class >> defaultName [

	^ 'Packages'
]

{ #category : #executing }
PackageFormulaManageCommand >> execute [
	(IceTipWorkingCopyBrowser on: self repositoryModel) openWithSpec
]

{ #category : #accessing }
PackageFormulaManageCommand >> iconName [

	^ #package
]

{ #category : #accessing }
PackageFormulaManageCommand >> shortcutKey [

	^ $p meta
]
