Class {
	#name : #PackageFormulasApp,
	#superclass : #SpApplication,
	#instVars : [
		'formulas',
		'group'
	],
	#category : #'EnvironmentProfiles-UI'
}

{ #category : #accessing }
PackageFormulasApp class >> updateApp [
	UIManager default
		informUserDuring: [ :bar | 
			bar label: 'Removing cached repository from github-cache'.
			bar current: 0.
			(FileLocator workingDirectory / 'github-cache' / 'hernanmd' / 'environment-profiles')
				ensureDeleteAll.
			bar label: 'Updating baseline definition'.
			bar current: 0.33.
			Iceberg enableMetacelloIntegration ifFalse: [ 
				Gofer new 
					url: 'github://hernanmd/environment-profiles/src' asZnUrl;
					package: 'BaselineOfEnvironmentProfiles';
					load ].
			bar label: 'Updating source files'.
			bar current: 0.66.
			Metacello new
				baseline: #EnvironmentProfiles;
				repository: 'github://hernanmd/environment-profiles/src';
				onConflict: [: ex | ex allow ]; 
				load: #default.
			bar current: 1 ].
]

{ #category : #accessing }
PackageFormulasApp >> formulas [

	^ formulas
		ifNil: [ formulas := OrderedCollection new  ]
]

{ #category : #accessing }
PackageFormulasApp >> formulas: anObject [

	formulas := anObject
]

{ #category : #accessing }
PackageFormulasApp >> group [

	^ group
]

{ #category : #accessing }
PackageFormulasApp >> group: anObject [

	group := anObject
]

{ #category : #accessing }
PackageFormulasApp >> start [
	" Private - See superimplementor's comment "

	(PackageFormulasMainUI newApplication: self) openWithSpec.
]

{ #category : #accessing }
PackageFormulasApp >> toolbarDisplayMode [

	^ StPharoSettings toolbarDisplayMode
]
