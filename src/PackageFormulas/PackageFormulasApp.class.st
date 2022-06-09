"
This is the main PackageFormulas Spec2 application class which:

- Handles the Formulas container: A class which acts as a repository of formulas.
- Provides convenience methods to retrieve formulas and its categories.
- Handles the application initialization: See the `PackageFormulasApp>>start` method.
- Creates a new entry for this application in the World menu.
- Can perform updates of both the application and formulas.

"
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

{ #category : #accessing }
PackageFormulasApp class >> appLocalWorkingDirectory [
	"Answer a <FileReference> pointing to the local application directory"

	^ (FileLocator workingDirectory / 'github-cache' / self repositoryOwnerDirectory / 'PackageFormulas' )
]

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
PackageFormulasApp class >> repositoryOwnerDirectory [

	^ 'hernanmd'
]

{ #category : #accessing }
PackageFormulasApp class >> updateApp [
	UIManager default
		informUserDuring: [ :bar | 
			bar label: 'Removing cached repository from github-cache'.
			bar current: 0.
			self appLocalWorkingDirectory ensureDeleteAll.
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

{ #category : #queries }
PackageFormulasApp >> formulas [
	"Answer a <Collection> of <PackageFormula>"

	^ PackageFormula allIn: self formulasContainer class
]

{ #category : #queries }
PackageFormulasApp >> formulasCategories [
	"Answer a <Collection> of <String> each describing a formula category"

	^ (self formulas flatCollect: #categories as: Set) collect: #capitalized
]

{ #category : #queries }
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

{ #category : #queries }
PackageFormulasApp >> packagesIn: aPackageGroupSymbol [
	"Answer a <Collection> for pacakges categorized in aPackageGroupSymbol"
	
	| pkgPragmaId |

	pkgPragmaId := (aPackageGroupSymbol allSatisfy: #isUppercase)
		ifFalse: [ aPackageGroupSymbol uncapitalized ]
		ifTrue: [ aPackageGroupSymbol ].
	^ PackageFormulas for: pkgPragmaId
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
