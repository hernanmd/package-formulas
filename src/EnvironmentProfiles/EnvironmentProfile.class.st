Class {
	#name : #EnvironmentProfile,
	#superclass : #Object,
	#category : #'EnvironmentProfiles-Core'
}

{ #category : #private }
EnvironmentProfile class >> generateMenuItems [
	<script>

	| menuItemTemplate foundPragmas |

	menuItemTemplate := 'menu0{1}EnvironmentsProfilesOn: aBuilder
	<worldMenu>

	(aBuilder item: #{2})
		parent: #Profiles;
		order: {1};
		label: ''{3}'';
		help: ''{3} Packages'';
		action: [ self openSelectorForPackagesIn: #{2} ]'.
	foundPragmas := (Pragma allIn: EnvironmentFormulas class) collect: #pragmas.
	(foundPragmas 
		flatCollect: [ : pragmaArray | pragmaArray collect: #selector ]
		as: Set) doWithIndex: [ : pragmaSelector : index | 
		self class 
			compile: (menuItemTemplate format: { index . pragmaSelector . pragmaSelector capitalized })
			classified: 'menu' ]
]

{ #category : #menu }
EnvironmentProfile class >> menu00EnvironmentsProfilesOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Profiles)
		parent: #Tools;
		label: 'Environment Profiles';
		icon: (self iconNamed: #catalog);
		help: 'Package installation profiles';
		order: 666
]

{ #category : #menu }
EnvironmentProfile class >> menu01EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #math)
		parent: #Profiles;
		order: 1;
		label: 'Math';
		help: 'Math Packages';
		action: [ self openSelectorForPackagesIn: #math ]
]

{ #category : #menu }
EnvironmentProfile class >> menu02EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #ide)
		parent: #Profiles;
		order: 1;
		label: 'Ide';
		help: 'Ide Packages';
		action: [ self openSelectorForPackagesIn: #ide ]
]

{ #category : #menu }
EnvironmentProfile class >> menu03EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #web)
		parent: #Profiles;
		order: 1;
		label: 'Web';
		help: 'Web Packages';
		action: [ self openSelectorForPackagesIn: #web ]
]

{ #category : #menu }
EnvironmentProfile class >> menu04EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #general)
		parent: #Profiles;
		order: 1;
		label: 'General';
		help: 'General Packages';
		action: [ self openSelectorForPackagesIn: #general ]
]

{ #category : #menu }
EnvironmentProfile class >> menu05EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #testing)
		parent: #Profiles;
		order: 1;
		label: 'Testing';
		help: 'Testing Packages';
		action: [ self openSelectorForPackagesIn: #testing ]
]

{ #category : #menu }
EnvironmentProfile class >> menu06EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #collections)
		parent: #Profiles;
		order: 1;
		label: 'Collections';
		help: 'Collections Packages';
		action: [ self openSelectorForPackagesIn: #collections ]
]

{ #category : #menu }
EnvironmentProfile class >> menu07EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #databases)
		parent: #Profiles;
		order: 1;
		label: 'Databases';
		help: 'Databases Packages';
		action: [ self openSelectorForPackagesIn: #databases ]
]

{ #category : #menu }
EnvironmentProfile class >> menu08EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #security)
		parent: #Profiles;
		order: 1;
		label: 'Security';
		help: 'Security Packages';
		action: [ self openSelectorForPackagesIn: #security ]
]

{ #category : #menu }
EnvironmentProfile class >> menu09EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #xml)
		parent: #Profiles;
		order: 1;
		label: 'Xml';
		help: 'Xml Packages';
		action: [ self openSelectorForPackagesIn: #xml ]
]

{ #category : #menu }
EnvironmentProfile class >> menu99EnvironmentsProfilesOn: aBuilder [
	<worldMenu>

	(aBuilder item: #all)
		parent: #Profiles;
		order: 99;
		label: 'All';
		help: 'All Packages';
		action: [ self openSelectorForPackagesIn: #all ]
]

{ #category : #menu }
EnvironmentProfile class >> openSelectorForPackages: aCollection [
	"Private - Open a window for packages in aCollection"
	
	EnvironmentProfileApp new
		formulas: (aCollection asSortedCollection: [ : p1 :p2 | p1 method selector <= p2 method selector ]);
		run.
]

{ #category : #menu }
EnvironmentProfile class >> openSelectorForPackagesIn: aPackageGroupSymbol [
	"Private - Open a window to select packages to install according to aPackageGroupSymbol"
	
	self openSelectorForPackages: (self packagesIn: aPackageGroupSymbol)
]

{ #category : #menu }
EnvironmentProfile class >> packagesIn: aPackageGroupSymbol [
	"Private - Answer a <Collection> for pacakges categorized in aPackageGroupSymbol"
	
	^ EnvironmentFormulas formulasFor: aPackageGroupSymbol
]
