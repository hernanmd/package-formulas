Class {
	#name : #EnvironmentFormulas,
	#superclass : #Object,
	#category : #'EnvironmentProfiles-Core'
}

{ #category : #formulas }
EnvironmentFormulas class >> abstractMath [
	<math>

	Metacello new 
		repository: 'github://astares/Pharo-AbstractMath/src';
		baseline: 'AbstractMath';
		load
]

{ #category : #formulas }
EnvironmentFormulas class >> artefact [
	<general>

	Metacello new
		githubUser: 'pharo-contributions' project: 'Artefact' commitish: 'master' path: 'src';
		baseline: 'Artefact';
		load
]

{ #category : #formulas }
EnvironmentFormulas class >> autotest [
	<testing>

	Metacello new 
		repository: 'github://pharo-contributions/Autotest:main/src';
		baseline: 'Autotest';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> blockStyler [
	<ide>

	Metacello new
		baseline: 'BlockStyler';
		repository: 'github://maenu/BlockStyler/repository';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> chanel [
	<general>

	Metacello new
		baseline: 'Chanel';
		repository: 'github://jecisc/Chanel:v1.x.x/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> collectionExtensions [
	<collections>

	Metacello new
		githubUser: 'pharo-contributions' project: 'CollectionExtensions' commitish: 'v1.x.x' path: 'src';
    	baseline: 'CollectionExtensions';
    	load.
]

{ #category : #formulas }
EnvironmentFormulas class >> commonUtils [
	<general>

	Metacello new
		baseline: 'CommonUtils';
		repository: 'github://hernanmd/CommonUtils/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> compendium [
	<ide>

	Metacello new 
		repository: 'github://astares/Pharo-Compendium/src';
		baseline: 'Compendium';
		load


]

{ #category : #formulas }
EnvironmentFormulas class >> containersEssentials [
	<collections>

	[ 
		Metacello new
			baseline: 'ContainersEssentials';
			repository: 'github://bauing-schmidt/Containers-Essentials';
			load 
	]
	on: MCMergeOrLoadWarning
	do: [ :warning | warning load ]

]

{ #category : #formulas }
EnvironmentFormulas class >> containersGrid [
	<collections>

	Metacello new
		baseline: 'ContainersGrid';
		repository: 'github://Ducasse/Containers-Grid/src';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> containersLinkedList [
	<collections>

	Metacello new
		baseline: 'ContainersLinkedList';
		repository: 'github://Ducasse/Containers-LinkedList';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> containersOrderedMultiMap [
	<collections>

	Metacello new
		baseline: 'ContainersOrderedMultiMap';	
		repository: 'github://Ducasse/Containers-OrderedMultiMap/src';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> containersPropertyEnvironment [
	<collections>

	Metacello new
		baseline: 'ContainersPropertyEnvironment';
		repository: 'github://Ducasse/Containers-PropertyEnvironment';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> cryptography [
	<security>

	Metacello new
		baseline: 'Cryptography';
		repository: 'github://pharo-contributions/Cryptography';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> dataFrame [
	<science>

	Metacello new
		baseline: 'DataFrame';
		repository: 'github://PolyMathOrg/DataFrame/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> deepTraverser [
	<general>

	Metacello new
		githubUser: 'pharo-contributions' project: 'DeepTraverser' commitish: 'master' path: 'src';
    	baseline: 'DeepTraverser';
    	load.
]

{ #category : #formulas }
EnvironmentFormulas class >> fame [
	<general>

	Metacello new
		baseline: 'Fame';
		repository: 'github://moosetechnology/Fame:development/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> famix [
	<general>

	Metacello new
		baseline: 'Famix';
		repository: 'github://moosetechnology/Famix:development/src';
		load.
]

{ #category : #accessing }
EnvironmentFormulas class >> formulasFor: aSymbol [
	"Answer a <Collection> of <CompiledMethod> of receiver's formulas"

	^ Pragma 
		allNamed: aSymbol
		in: self class.
]

{ #category : #formulas }
EnvironmentFormulas class >> garage [
	<databases>

    Metacello new
		githubUser: 'pharo-rdbms' project: 'garage' commitish: 'master' path: '';
		baseline: 'Garage';
    	load
]

{ #category : #formulas }
EnvironmentFormulas class >> geoJSON [
	<general>

	Metacello new
		baseline: 'GeoJSON';
		repository: 'github://zweidenker/GeoJSON';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> geometry [
	<math>

	Metacello new
		baseline: 'Geometry';
		repository: 'github://peteruhnak/geometry/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> getText [
	<general>

	Metacello new
		baseline: 'Gettext';
		repository: 'github://pharo-contributions/Gettext/source';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> graphQl [
	<web>

	Metacello new
		baseline: 'GraphQL';
		repository: 'github://OBJECTSEMANTICS/GraphQL';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> grease [
	<general>

	Metacello new
		baseline: 'Grease';
		repository: 'github://GsDevKit/Grease:master/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> harbour [
	<ide>

	Metacello new 
		repository: 'github://astares/Pharo-Harbour/src';
		baseline: 'Harbour';
		load


]

{ #category : #formulas }
EnvironmentFormulas class >> hashTable [
	<collections>

	Metacello new
		githubUser: 'pharo-contributions' project: 'Hashtable' commitish: 'v1.x.x' path: 'src';
		baseline: 'Hashtable';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> infinity [
	<math>

	Metacello new 
		repository: 'github://astares/Pharo-Infinity/src';
		baseline: 'Infinity';
		load
]

{ #category : #formulas }
EnvironmentFormulas class >> kobold [
	<web>

	Metacello new
		baseline: 'Kobold';
		repository: 'github://juliangrigera/Kobold';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> magicLiteralsSelector [
	<ide>

	Metacello new
		repository: 'github://juliendelplanque/MagicLiteralsSelector/src';
		baseline: 'MagicLiteralsSelector';
		load

]

{ #category : #formulas }
EnvironmentFormulas class >> mathemagics [
	<math>

	Gofer new
		url: 'https://github.com/grpistoia/Mathemagics';
		package: 'Mathemagics';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> methodProxies [
	<general>

	Metacello new
		baseline: 'MethodProxies';
		repository: 'github://pharo-contributions/MethodProxies/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> mirage [
	<ide>

	Metacello new
		repository: 'github://JulienDelplanque/Mirage:dev/src';
		baseline: 'Mirage';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> mustache [
	<general>

	Metacello new
		baseline: 'Mustache';
		repository: 'github://noha/mustache/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> neoCsv [
	<general>

	Metacello new
		baseline: 'NeoCSV';
		repository: 'github://svenvc/NeoCSV/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> neoJson [
	<general>

	Metacello new
		baseline: 'NeoJSON';
		repository: 'github://svenvc/NeoJSON/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> orderPreservingDictionary [
	<collections>

	Metacello new
		baseline: 'OrderPreservingDictionary';
		repository: 'github://pharo-contributions/OrderPreservingDictionary/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> osSubprocess [
	<general>

	Metacello new
 		baseline: 'OSSubprocess';
		repository: 'github://pharo-contributions/OSSubprocess:master/repository';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> pastell [
	<xml>

	Metacello new
		baseline: 'Pastell';
		repository: 'github://pharo-contributions/XML-Pastell/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> petitParser [
	<general>

	Metacello new
		baseline: 'PetitParser';
		repository: 'github://moosetechnology/PetitParser:v3.x.x/src';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> pharoI18n [
	<ide>

	Metacello new
		baseline: 'I18N';
		repository: 'github://astares/Pharo-I18N/src';
		load

]

{ #category : #formulas }
EnvironmentFormulas class >> pharoODBC [
	<databases>

	Metacello new
		repository: 'github://pharo-rdbms/Pharo-ODBC/src';
		baseline: 'ODBC';
		load
]

{ #category : #formulas }
EnvironmentFormulas class >> pharoSQLite3 [
	<databases>

	Metacello new
		repository: 'github://pharo-rdbms/Pharo-SQLite3/src';
		baseline: 'SQLite3';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> polyMath [
	<science>

	Metacello new
		baseline: 'PolyMath';
		repository: 'github://PolyMathOrg/PolyMath/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> projectFramework [
	<general>

	Metacello new
		baseline: 'ProjectFramework';
		repository: 'github://hernanmd/ProjectFramework/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> punQLite [
	<databases>

	Metacello new 
		repository: 'github://pharo-nosql/PunQLite/repository';
		baseline: 'PunQLite';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> quickAccess [
	<ide>

	Metacello new 
		repository: 'github://astares/Pharo-QuickAccess/src';
		baseline: 'QuickAccess';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> sState [
	<general>

	Metacello new
		baseline: 'SState';
		repository: 'github://mumez/SState/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> scheduler [
	<general>

	Metacello new 
		repository: 'github://pharo-contributions/Scheduler/src';
		baseline: 'Scheduler';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> smartTest [
	<testing>

	Metacello new
		baseline: #SmartTest;
		githubUser: 'badetitou' project: 'SmartTest' commitish: 'development' path: '.';
		onWarningLog;
		load
]

{ #category : #formulas }
EnvironmentFormulas class >> soup [
	<web>

	Metacello new
		baseline: 'Soup';
		repository: 'github://Ducasse/Soup';
		load
]

{ #category : #formulas }
EnvironmentFormulas class >> stringExtensions [
	<collections>

	Metacello new
		baseline: 'StringExtensions';
		repository: 'github://hernanmd/StringExtensions/repository';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> systemInteraction [
	<general>

	Metacello new
		baseline: 'SystemInteraction';
		repository: 'github://jecisc/SystemInteraction:v1.x.x/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> tasksLogger [
	<web>

	Metacello new
		baseline: 'TasksLogger';
		repository: 'github://juliangrigera/Tycho';
		onConflictUseLoaded;
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> tealight [
	<web>

	Metacello new 
		repository: 'github://astares/Tealight/repository';
		baseline: 'Tealight';
		load 
]

{ #category : #formulas }
EnvironmentFormulas class >> treeQuery [
	<general>

	Metacello new
		repository: 'github://JulienDelplanque/TreeQuery/src';
		baseline: 'TreeQuery';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> voyageEjdb [
	<databases>

	Metacello new 
		repository: 'github://pharo-nosql/voyage/mc';
		baseline: 'Voyage';
		load: 'ejdb tests'.
]

{ #category : #formulas }
EnvironmentFormulas class >> voyageMongo [
	<databases>

	Metacello new 
		repository: 'github://pharo-nosql/voyage/mc';
		baseline: 'Voyage';
		load: 'mongo tests'.
]

{ #category : #formulas }
EnvironmentFormulas class >> xPath [
	<xml>

	Metacello new
		baseline: 'XPath';
		repository: 'github://pharo-contributions/XML-XPath/src';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> xmlParser [
	<xml>

	Metacello new
		baseline: 'XMLParser';
		repository: 'github://pharo-contributions/XML-XMLParser/src';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> xmlParserHTML [
	<xml>

	Metacello new
		baseline: 'XMLParserHTML';
		repository: 'github://pharo-contributions/XML-XMLParserHTML/src';
		load.

]

{ #category : #formulas }
EnvironmentFormulas class >> xmlParserStAX [
	<xml>

	Metacello new
		baseline: 'XMLParserStAX';
		repository: 'github://pharo-contributions/XML-XMLParserStAX/src';
		load.
]

{ #category : #formulas }
EnvironmentFormulas class >> xmlWriter [
	<xml>

	Metacello new
		baseline: 'XMLWriter';
		repository: 'github://pharo-contributions/XML-XMLWriter/src';
		load.

]
