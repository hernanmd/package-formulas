Class {
	#name : #PackageFormulasApp,
	#superclass : #SpApplication,
	#instVars : [
		'formulas',
		'formulasContainer',
		'group'
	],
	#category : #'PackageFormulas-UI'
}

{ #category : #private }
PackageFormulasApp class >> menuPackageFormulasOn: aBuilder [
	<worldMenu>

	(aBuilder item: #Profiles)
		parent: #Tools;
		label: 'Package Formulas';
		icon: (self iconNamed: #catalog);
		action: [ PackageFormulasApp new run ];
		help: 'Package installation profiles';
		order: 627
]

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

{ #category : #defaults }
PackageFormulasApp >> defaultFormulasContainer [
	"Answer a <Class> responsible of storing the <PackageFormula> the receiver will use to operate"

	^ PackageFormulas
]

{ #category : #private }
PackageFormulasApp >> formulas [
	"Answer a <Collection> of <PackageFormula>"

	^ PackageFormula allIn: self formulasContainer class
]

{ #category : #accessing }
PackageFormulasApp >> formulas: anObject [

	formulas := anObject
]

{ #category : #private }
PackageFormulasApp >> formulasCategories [
	"Answer a <Collection> of <String> each describing a formula category"

	^ (self formulas
		flatCollect: [ : pragmaArray | pragmaArray collect: #selector ]
		as: Set) collect: [ : pragmaSelector | pragmaSelector capitalized ]
]

{ #category : #private }
PackageFormulasApp >> formulasContainer [
	"Answer a <Class> responsible of storing the <PackageFormula>s"
	
	^ formulasContainer
		ifNil: [ formulasContainer := self defaultFormulasContainer ]
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
