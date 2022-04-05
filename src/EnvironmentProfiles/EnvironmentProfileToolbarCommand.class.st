Class {
	#name : #EnvironmentProfileToolbarCommand,
	#superclass : #CmCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #accessing }
EnvironmentProfileToolbarCommand class >> defaultShortcut [

	^ nil
]

{ #category : #accessing }
EnvironmentProfileToolbarCommand >> application [

	^ context application
]

{ #category : #converting }
EnvironmentProfileToolbarCommand >> asSpecCommand [ 
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
EnvironmentProfileToolbarCommand >> selectedFormulas [

	^ self context selectedFormulas
]
