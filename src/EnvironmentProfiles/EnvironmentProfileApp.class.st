Class {
	#name : #EnvironmentProfileApp,
	#superclass : #SpApplication,
	#instVars : [
		'formulas'
	],
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #accessing }
EnvironmentProfileApp >> formulas [

	^ formulas
]

{ #category : #accessing }
EnvironmentProfileApp >> formulas: anObject [

	formulas := anObject
]

{ #category : #accessing }
EnvironmentProfileApp >> start [
	" Private - See superimplementor's comment "

	(EnvironmentProfileUI newApplication: self) openWithSpec.
]
