"
Abstract superclass grouping behavior for PackageFormulas application toolbar buttons.
See subclasses for specific functionality.

"
Class {
	#name : #PFToolbarCommand,
	#superclass : #CmCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #accessing }
PFToolbarCommand class >> defaultShortcut [

	^ nil
]

{ #category : #accessing }
PFToolbarCommand >> application [

	^ self context application
]

{ #category : #converting }
PFToolbarCommand >> asSpecCommand [ 
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
PFToolbarCommand >> selectedFormulas [

	^ self context selectedFormulas
]

{ #category : #accessing }
PFToolbarCommand >> stBrowser [

	^ Smalltalk tools browser
]
