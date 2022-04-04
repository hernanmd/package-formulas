Class {
	#name : #EnvironmentProfileCommand,
	#superclass : #CmCommand,
	#category : #'EnvironmentProfiles-UI-Commands'
}

{ #category : #accessing }
EnvironmentProfileCommand class >> defaultShortcut [

	^ nil
]

{ #category : #accessing }
EnvironmentProfileCommand >> application [

	^ context application
]

{ #category : #converting }
EnvironmentProfileCommand >> asSpecCommand [ 
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
EnvironmentProfileCommand >> selectedFormulas [

	^ self context selectedFormulas
]
