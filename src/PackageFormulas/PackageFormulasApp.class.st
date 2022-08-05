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
PackageFormulasApp class >> repositoryAddress [

	^ 'github://' , self repositoryOwnerDirectory , self repositorySourceDirectory
]

{ #category : #accessing }
PackageFormulasApp class >> repositoryHttpAddress [

	^ 'http://www.github.com/' , self repositoryOwnerDirectory , '/package-formulas'
]

{ #category : #accessing }
PackageFormulasApp class >> repositoryOwnerDirectory [

	^ 'hernanmd'
]

{ #category : #accessing }
PackageFormulasApp class >> repositorySourceDirectory [

	^ '/package-formulas/src'
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
			self updateBaseline.
			bar label: 'Updating source files'.
			bar current: 0.66.
			self updatePackage.
			bar current: 1 ].
	^ self inform: 'Update finished'
]

{ #category : #accessing }
PackageFormulasApp class >> updateBaseline [
		
	Iceberg enableMetacelloIntegration ifFalse: [ 
		Gofer new 
			url: self repositoryAddress asZnUrl;
			package: 'BaselineOfPackageFormulas';
			load ].

]

{ #category : #accessing }
PackageFormulasApp class >> updatePackage [

	EpMonitor disableDuring: [ 
		Metacello new
			baseline: #PackageFormulas;
			repository: self repositoryAddress;
			onConflict: [: ex | ex allow ]; 
			load: #default ]

]

{ #category : #defaults }
PackageFormulasApp >> defaultFormulasContainer [
	"Answer a <Class> responsible of storing the <PackageFormula> the receiver will use to operate"

	^ PackageFormulas
]

{ #category : #queries }
PackageFormulasApp >> formulas [
	"Answer a <Collection> of <PackageFormula> found in the receiver's environment"

	^ PackageFormulas allIn: self formulasContainer class
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

{ #category : #queries }
PackageFormulasApp >> formulasIn: aPackageCategorySymbol [
	"Answer a <Collection> for pacakges categorized in aPackageGroupSymbol"
	
	^ aPackageCategorySymbol asLowercase = 'all'
		ifTrue: [ self formulas ]
		ifFalse: [ self formulasInCategory: aPackageCategorySymbol ]

]

{ #category : #queries }
PackageFormulasApp >> formulasInCategory: aPackageCategorySymbol [
	"Answer a <Collection> of <Symbol> representing a package formula in aPackageCategorySymbol"

	| pkgPragmaId |

	pkgPragmaId := (aPackageCategorySymbol allSatisfy: #isUppercase)
		ifFalse: [ aPackageCategorySymbol uncapitalized ]
		ifTrue: [ aPackageCategorySymbol ].
	^ PackageFormulas for: pkgPragmaId

]

{ #category : #accessing }
PackageFormulasApp >> group [

	^ group
]

{ #category : #accessing }
PackageFormulasApp >> group: anObject [

	group := anObject
]

{ #category : #testing }
PackageFormulasApp >> hasFormulasInstalled [
	"Answer <true> if the receiver's image includes any of its defined formulas already installed"
	
	^ self formulas anySatisfy: #hasPackageInstalled
]

{ #category : #accessing }
PackageFormulasApp >> installedFormulas [
	"Answer a <Collection> of <PackageFormula> installed in the receiver's environment"

	^ self formulas select: #hasPackageInstalled
]

{ #category : #accessing }
PackageFormulasApp >> selectedFormulas [
	"Answer a <Collection> with the formulas marked for installation"
	
	^ self 
		propertyAt: #selectedFormulas
		ifAbsentPut: [ Set new ]
]

{ #category : #accessing }
PackageFormulasApp >> start [
	" Private - See superimplementor's comment "

	(PackageFormulasMainUI newApplication: self) open.
]

{ #category : #accessing }
PackageFormulasApp >> toolbarDisplayMode [

	^ StPharoSettings toolbarDisplayMode
]
