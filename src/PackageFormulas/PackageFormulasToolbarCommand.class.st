"
Abstract superclass grouping behavior for PackageFormulas application toolbar buttons.
See subclasses for specific functionality.

"
Class {
	#name : #PackageFormulasToolbarCommand,
	#superclass : #CmCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #accessing }
PackageFormulasToolbarCommand class >> defaultShortcut [

	^ nil
]

{ #category : #accessing }
PackageFormulasToolbarCommand >> application [

	^ self context application
]

{ #category : #converting }
PackageFormulasToolbarCommand >> asSpecCommand [ 
	| command |
	
	command := super asSpecCommand 
		iconProvider: self application;
		iconName: self class defaultIconName;
		yourself.
		
	self class defaultShortcut 
		ifNotNil: [ :keyCombination | command shortcutKey: keyCombination ].
		
	^ command
]

{ #category : #execution }
PackageFormulasToolbarCommand >> selectedFormulas [

	^ self context selectedFormulas
]
