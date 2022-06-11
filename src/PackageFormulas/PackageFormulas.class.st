"
Acts as a repository of `PackageFormula`. Each PackageFormula can be browsed in the class side.

"
Class {
	#name : #PackageFormulas,
	#superclass : #Object,
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PackageFormulas class >> @ formulaName [
	"Answer a <PackageFormula> identified by formulaName <Symbol>"
	
	^ (self class >> formulaName) formula
]

{ #category : #formulas }
PackageFormulas class >> abstractMath [
	<formula: #math>

	Metacello new 
		repository: 'github://astares/Pharo-AbstractMath/src';
		baseline: 'AbstractMath';
		load
]

{ #category : #accessing }
PackageFormulas class >> allIn: aClass [
	"Answer a <Collection> of <PackageFormula> found in aClass"

	^ (aClass methods select: #hasPragma) collect: #formula
]

{ #category : #accessing }
PackageFormulas class >> allNamed: aSymbol in: aClass [
	"Answer a <Collection> of all <PackageFormula> found in methods of aClass whose selector is aSymbol."
	
	^ Array streamContents: [ :stream |
		 aClass formulasDo: [ : formula |
			(formula categories includes: aSymbol)
				ifTrue: [ stream nextPut: formula ] ] ]
]

{ #category : #formulas }
PackageFormulas class >> artefact [
	<formula: #general>

	Metacello new
		githubUser: 'pharo-contributions' project: 'Artefact' commitish: 'master' path: 'src';
		baseline: 'Artefact';
		load
]

{ #category : #formulas }
PackageFormulas class >> autotest [
	<formula: #testing>

	Metacello new 
		repository: 'github://pharo-contributions/Autotest:main/src';
		baseline: 'Autotest';
		load.
]

{ #category : #formulas }
PackageFormulas class >> awsSdkSmalltalk [
	<formula: #general>

	Metacello new
		baseline: 'AWS';
		repository: 'github://newapplesho/aws-sdk-smalltalk/pharo-repository';
		onConflictUseLoaded;
		load.
]

{ #category : #formulas }
PackageFormulas class >> bloc [
	<formula: #graphics>

	Metacello new
		baseline: 'NewBloc';
		repository: 'github://pharo-graphics/Bloc/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> blocPac [
	<formula: #graphics>

	Metacello new
		baseline: 'NewBlocPac';
		repository: 'github://pharo-graphics/bloc-pac/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> blockStyler [
	<formula: #IDE>

	Metacello new
		baseline: 'BlockStyler';
		repository: 'github://maenu/BlockStyler/repository';
		load.

]

{ #category : #formulas }
PackageFormulas class >> boardwalk [
	<formula: #web>

	Metacello new
		baseline: 'Boardwalk';
		repository: 'github://ba-st/Boardwalk:release-candidate/source';
		load.
]

{ #category : #formulas }
PackageFormulas class >> brick [
	<formula: #graphics>

	Metacello new
        baseline: 'NewBrick';
        repository: 'github://pharo-graphics/Brick/src';
        load.
]

{ #category : #formulas }
PackageFormulas class >> cannon [
	<formula: #general>

	Metacello new
		baseline: 'Cannon';
		repository: 'github://ba-st/Cannon:release-candidate/source';
		load.
]

{ #category : #formulas }
PackageFormulas class >> chanel [
	<formula: #general>

	Metacello new
		baseline: 'Chanel';
		repository: 'github://jecisc/Chanel:v1.x.x/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> collectionExtensions [
	<formula: #collections>

	Metacello new
		githubUser: 'pharo-contributions' project: 'CollectionExtensions' commitish: 'v1.x.x' path: 'src';
    	baseline: 'CollectionExtensions';
    	load.
]

{ #category : #formulas }
PackageFormulas class >> commonUtils [
	<formula: #general>

	Metacello new
		baseline: 'CommonUtils';
		repository: 'github://hernanmd/CommonUtils/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> compendium [
	<formula: #IDE>

	Metacello new 
		repository: 'github://astares/Pharo-Compendium/src';
		baseline: 'Compendium';
		load


]

{ #category : #formulas }
PackageFormulas class >> consultingDetective [
	<formula: #general>

	Metacello new
		baseline: 'ConsultingDetective';
		repository: 'github://olekscode/ConsultingDetective/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersArray2D [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersArray2D';
		repository: 'github://pharo-containers/Containers-Array2D/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersBTree [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersBTree';
		repository: 'github://Ducasse/Containers-BTree';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersEssentials [
	<formula: #collections>

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
PackageFormulas class >> containersGrid [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersGrid';
		repository: 'github://Ducasse/Containers-Grid/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersHashTable [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersHashTable';
		repository: 'github://pharo-containers/Containers-HashTable/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersKeyedTree [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersKeyedTree';
		repository: 'github://pharo-containers/Containers-KeyedTree:v1.0/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersLinkedList [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersLinkedList';
		repository: 'github://Ducasse/Containers-LinkedList';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersOrderPreservingDictionary [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersOrderPreservingDictionary';
		repository: 'github://pharo-containers/Containers-OrderPreservingDictionary';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersOrderedMultiMap [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersOrderedMultiMap';	
		repository: 'github://Ducasse/Containers-OrderedMultiMap/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersOrderedSet [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersOrderedSet';
		repository: 'github://pharo-containers/Containers-OrderedSet/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersPropertyEnvironment [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersPropertyEnvironment';
		repository: 'github://Ducasse/Containers-PropertyEnvironment';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersQueue [
	<formula: #collections>

	Metacello new
 		baseline: 'ContainersQueue';
		repository: 'github://pharo-containers/Containers-Queue/';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersRope [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersRope';
		repository: 'github://pharo-containers/Containers-Rope/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> containersRunArraye [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersRunArray';
		repository: 'github://pharo-containers/Containers-RunArray/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersStack [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersStack';
		repository: 'github://pharo-containers/Containers-Stack:v1.0/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersTrie [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersTrie';
		repository: 'github://pharo-containers/Containers-Trie/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> containersUniqueOrdered [
	<formula: #collections>

	Metacello new
		baseline: 'ContainersUniqueOrdered';
		repository: 'github://pharo-containers/Containers-UniqueOrdered';
		load.
]

{ #category : #formulas }
PackageFormulas class >> cormas [
	<formula: #science>

	Metacello new
		baseline: 'Cormas';
		repository: 'github://Cormas/Cormas/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> cryptoNacl [
	<formula: #security>

	Metacello new
		baseline: 'CryptoNacl';
		repository: 'github://objectguild/Crypto-Nacl:master';
		load.
]

{ #category : #formulas }
PackageFormulas class >> cryptography [
	<formula: #security>

	Metacello new
		baseline: 'Cryptography';
		repository: 'github://pharo-contributions/Cryptography';
		load.
]

{ #category : #formulas }
PackageFormulas class >> dataBindings [
	<formula: #web>

	Metacello new
		baseline: 'DataBindings';
		repository: 'github://dorellang/DataBindings/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> dataFrame [
	<formula: #science>

	Metacello new
		baseline: 'DataFrame';
		repository: 'github://PolyMathOrg/DataFrame/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> deepTraverser [
	<formula: #general>

	Metacello new
		githubUser: 'pharo-contributions' project: 'DeepTraverser' commitish: 'master' path: 'src';
    	baseline: 'DeepTraverser';
    	load.
]

{ #category : #formulas }
PackageFormulas class >> documentationSupport [
	<formula: #documentation>

	Metacello new
		baseline: 'DocumentationSupport';
		repository: 'github://pavel-krivanek/DocumentationSupport:main/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> elasticsearch [
	<formula: #general>

	Metacello new
		baseline: 'Elasticsearch';
		repository: 'github://newapplesho/elasticsearch-smalltalk/pharo-repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> ethel [
	<formula: #web>

	Metacello new
		baseline: 'Ethel';
		repository: 'github://grype/Ethel';
		load.
]

{ #category : #formulas }
PackageFormulas class >> fame [
	<formula: #general>

	Metacello new
		baseline: 'Fame';
		repository: 'github://moosetechnology/Fame:development/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> famix [
	<formula: #general>

	Metacello new
		baseline: 'Famix';
		repository: 'github://moosetechnology/Famix:development/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> fileLibraryHelper [
	<formula: #web>

    Metacello new
    	githubUser: 'DuneSt' project: 'FileLibraryHelper' commitish: 'v1.x.x' path: 'src';
    	baseline: 'FileLibraryHelper';
    	onWarningLog;
    	load
]

{ #category : #formulas }
PackageFormulas class >> fixedDecimal [
	<formula: #math>

	Metacello new
		repository: 'github://hernanmd/FixedDecimal/repository';	
		baseline: 'FixedDecimal';
		load.
]

{ #category : #formulas }
PackageFormulas class >> fog [
	<formula: #blockchain>

	Metacello new
		baseline: 'Fog';
		repository: 'github://smartanvil/Fog/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> fogEvm [
	<formula: #blockchain>

	Metacello new
		baseline: 'FogEVM';
		repository: 'github://smartanvil/FogEVM/src';
		load.
]

{ #category : #accessing }
PackageFormulas class >> for: aCategorySymbol [
	"Answer a <Collection> of <PackageFormula> matching receiver's formulas in aCategorySymbol"

	^ self 
		allNamed: aCategorySymbol
		in: self class
]

{ #category : #formulas }
PackageFormulas class >> function [
	<formula: #math>

	Metacello new
		baseline: 'Function';
		repository: 'github://olekscode/Function/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> gadm [
	<formula: #GIS>

	Metacello new
		repository: 'github://hernanmd/GADM/repository';
		baseline: 'GADM';
		load.
]

{ #category : #formulas }
PackageFormulas class >> garage [
	<formula: #databases>

    Metacello new
		githubUser: 'pharo-rdbms' project: 'garage' commitish: 'master' path: '';
		baseline: 'Garage';
    	load
]

{ #category : #formulas }
PackageFormulas class >> geoJSON [
	<formula: #general>

	Metacello new
		baseline: 'GeoJSON';
		repository: 'github://zweidenker/GeoJSON';
		load.
]

{ #category : #formulas }
PackageFormulas class >> geoSphere [
	<formula: #GIS>

	Metacello new
		repository: 'github://akgrant43/GeoSphere/src';
		baseline: 'GeoSphere';
		load
]

{ #category : #formulas }
PackageFormulas class >> geometry [
	<formula: #math>

	Metacello new
		baseline: 'Geometry';
		repository: 'github://peteruhnak/geometry/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> getText [
	<formula: #general>

	Metacello new
		baseline: 'Gettext';
		repository: 'github://pharo-contributions/Gettext/source';
		load.
]

{ #category : #formulas }
PackageFormulas class >> ghost [
	<formula: #IDE>

	Metacello new
		baseline: 'Ghost';
		repository: 'github://pharo-ide/Ghost';
		load

]

{ #category : #formulas }
PackageFormulas class >> graphQl [
	<formula: #web>

	Metacello new
		baseline: 'GraphQL';
		repository: 'github://OBJECTSEMANTICS/GraphQL';
		load.
]

{ #category : #formulas }
PackageFormulas class >> graphViz [
	<formula: #graphics>

	Metacello new
		baseline: 'GraphViz';
		repository: 'github://hernanmd/GraphViz';
		load.
]

{ #category : #formulas }
PackageFormulas class >> grease [
	<formula: #general>

	Metacello new
		baseline: 'Grease';
		repository: 'github://GsDevKit/Grease:master/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> harbour [
	<formula: #IDE>

	Metacello new 
		repository: 'github://astares/Pharo-Harbour/src';
		baseline: 'Harbour';
		load


]

{ #category : #formulas }
PackageFormulas class >> hashTable [
	<formula: #collections>

	Metacello new
		githubUser: 'pharo-contributions' project: 'Hashtable' commitish: 'v1.x.x' path: 'src';
		baseline: 'Hashtable';
		load.
]

{ #category : #formulas }
PackageFormulas class >> heimdall [
	<formula: #web>

    Metacello new
    	githubUser: 'DuneSt' project: 'Heimdall' commitish: 'v1.x.x' path: 'src';
    	baseline: 'Heimdall';
    	onWarningLog;
		onUpgrade: [ :e | e useIncoming ];
    	load
]

{ #category : #formulas }
PackageFormulas class >> highchartsSt [
	<formula: #web>

	Metacello new
		baseline: 'HighchartsSt';
		repository: 'github://ba-st/HighchartsSt:release-candidate/source';
		load.
]

{ #category : #formulas }
PackageFormulas class >> hunter [
	<formula: #reverse_engineering>

	Metacello new
		baseline: 'Hunter';
		repository: 'github://dorellang/hunter:master/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> iconFactory [
	<formula: #graphics>

	Metacello new
		baseline: #IconFactory;
		repository: 'github://peteruhnak/IconFactory/repository';
		load

]

{ #category : #formulas }
PackageFormulas class >> infinity [
	<formula: #math>

	Metacello new 
		repository: 'github://astares/Pharo-Infinity/src';
		baseline: 'Infinity';
		load
]

{ #category : #formulas }
PackageFormulas class >> iterators [
	<formula: #collections>

	Metacello new
		baseline: 'Iterators';
		repository: 'github://juliendelplanque/Iterators/src';
		load
]

{ #category : #formulas }
PackageFormulas class >> kobold [
	<formula: #web>

	Metacello new
		baseline: 'Kobold';
		repository: 'github://juliangrigera/Kobold';
		load.
]

{ #category : #formulas }
PackageFormulas class >> mDBaseGenerator [
	<formula: #web>

    Metacello new
    	githubUser: 'DuneSt' project: 'MDBaseGenerator' commitish: 'master' path: 'src';
    	baseline: 'MDBaseGenerator';
    	load
]

{ #category : #formulas }
PackageFormulas class >> magicLiteralsSelector [
	<formula: #IDE>

	Metacello new
		repository: 'github://juliendelplanque/MagicLiteralsSelector/src';
		baseline: 'MagicLiteralsSelector';
		load

]

{ #category : #formulas }
PackageFormulas class >> magritte [
	<formula: #general>

	Metacello new
		baseline: 'Magritte';
		repository: 'github://magritte-metamodel/Magritte';
		load
]

{ #category : #formulas }
PackageFormulas class >> mathemagics [
	<formula: #math>

	Gofer new
		url: 'https://github.com/grpistoia/Mathemagics';
		package: 'Mathemagics';
		load.

]

{ #category : #formulas }
PackageFormulas class >> methodProxies [
	<formula: #general>

	Metacello new
		baseline: 'MethodProxies';
		repository: 'github://pharo-contributions/MethodProxies/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> mirage [
	<formula: #IDE>

	Metacello new
		repository: 'github://JulienDelplanque/Mirage:dev/src';
		baseline: 'Mirage';
		load.

]

{ #category : #formulas }
PackageFormulas class >> mocketry [
	<formula: #testing>

	Metacello new
		baseline: 'Mocketry';
		repository: 'github://dionisiydk/Mocketry';
		load
]

{ #category : #formulas }
PackageFormulas class >> mqtt [
	<formula: #general>

	Metacello new
		repository: 'github://svenvc/mqtt/repository';
		baseline: 'MQTT';
		load.

]

{ #category : #formulas }
PackageFormulas class >> mustache [
	<formula: #general>

	Metacello new
		baseline: 'Mustache';
		repository: 'github://noha/mustache/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> mutalk [
	<formula: #testing>

	Metacello new
		baseline: 'MuTalk';
		repository: 'github://pavel-krivanek/mutalk/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> neoCsv [
	<formula: #general>

	Metacello new
		baseline: 'NeoCSV';
		repository: 'github://svenvc/NeoCSV/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> neoJson [
	<formula: #general>
	<formula: #parsing>

	Metacello new
		baseline: 'NeoJSON';
		repository: 'github://svenvc/NeoJSON/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> openApi [
	<formula: #general>

	Metacello new
		baseline: 'OpenAPI';
		repository: 'github://zweidenker/OpenAPI/source';
		load
]

{ #category : #formulas }
PackageFormulas class >> orderPreservingDictionary [
	<formula: #collections>

	Metacello new
		baseline: 'OrderPreservingDictionary';
		repository: 'github://pharo-contributions/OrderPreservingDictionary/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> osSubprocess [
	<formula: #general>

	Metacello new
 		baseline: 'OSSubprocess';
		repository: 'github://pharo-contributions/OSSubprocess:master/repository';
		load.

]

{ #category : #formulas }
PackageFormulas class >> pastell [
	<formula: #XML>

	Metacello new
		baseline: 'Pastell';
		repository: 'github://pharo-contributions/XML-Pastell/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> petitParser [
	<formula: #general>

	Metacello new
		baseline: 'PetitParser';
		repository: 'github://moosetechnology/PetitParser:v3.x.x/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> pharoEnhacements [
	<formula: #IDE>

	Metacello new
		baseline: 'PharoEnhancements';
		repository: 'github://seandenigris/Pharo-Enhancements';
		"onConflict: [ :ex | ex allow ];"
		load: #('ALL')
]

{ #category : #formulas }
PackageFormulas class >> pharoI18n [
	<formula: #IDE>

	Metacello new
		baseline: 'I18N';
		repository: 'github://astares/Pharo-I18N/src';
		load

]

{ #category : #formulas }
PackageFormulas class >> pharoODBC [
	<formula: #databases>

	Metacello new
		repository: 'github://pharo-rdbms/Pharo-ODBC/src';
		baseline: 'ODBC';
		load
]

{ #category : #formulas }
PackageFormulas class >> pharoSQLite3 [
	<formula: #databases>

	Metacello new
		repository: 'github://pharo-rdbms/Pharo-SQLite3/src';
		baseline: 'SQLite3';
		load.
]

{ #category : #formulas }
PackageFormulas class >> polyMath [
	<formula: #science>

	Metacello new
		baseline: 'PolyMath';
		repository: 'github://PolyMathOrg/PolyMath/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> projectFramework [
	<formula: #general>

	Metacello new
		baseline: 'ProjectFramework';
		repository: 'github://hernanmd/ProjectFramework/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> punQLite [
	<formula: #databases>

	Metacello new 
		repository: 'github://pharo-nosql/PunQLite/repository';
		baseline: 'PunQLite';
		load.
]

{ #category : #formulas }
PackageFormulas class >> quickAccess [
	<formula: #IDE>

	Metacello new 
		repository: 'github://astares/Pharo-QuickAccess/src';
		baseline: 'QuickAccess';
		load.

]

{ #category : #formulas }
PackageFormulas class >> sState [
	<formula: #general>

	Metacello new
		baseline: 'SState';
		repository: 'github://mumez/SState/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> scheduler [
	<formula: #general>

	Metacello new 
		repository: 'github://pharo-contributions/Scheduler/src';
		baseline: 'Scheduler';
		load.
]

{ #category : #formulas }
PackageFormulas class >> seamless [
	<formula: #IDE>

	Metacello new
		baseline: 'Seamless';
		repository: 'github://pharo-ide/Seamless';
		load
]

{ #category : #formulas }
PackageFormulas class >> seaside [
	<formula: #web>

	Metacello new
		baseline:'Seaside3';
		repository: 'github://SeasideSt/Seaside:master/repository';
		load
]

{ #category : #formulas }
PackageFormulas class >> seasideQuasar [
	<formula: #web>

	Metacello new
		repository: 'github://yannij/Seaside-Quasar:main/src';
		baseline: 'SeasideQuasar';
		onConflictUseLoaded;
		load: 'all'.

]

{ #category : #formulas }
PackageFormulas class >> smartTest [
	<formula: #testing>

	Metacello new
		baseline: #SmartTest;
		githubUser: 'badetitou' project: 'SmartTest' commitish: 'development' path: '.';
		onWarningLog;
		load
]

{ #category : #formulas }
PackageFormulas class >> soup [
	<formula: #web>

	Metacello new
		baseline: 'Soup';
		repository: 'github://Ducasse/Soup';
		load
]

{ #category : #formulas }
PackageFormulas class >> sparta [
	<formula: #graphics>

	Metacello new
		baseline: 'Sparta';
		repository: 'github://pharo-graphics/sparta/src';
		load

]

{ #category : #formulas }
PackageFormulas class >> stringExtensions [
	<formula: #collections>

	Metacello new
		baseline: 'StringExtensions';
		repository: 'github://hernanmd/StringExtensions/repository';
		load.
]

{ #category : #formulas }
PackageFormulas class >> systemInteraction [
	<formula: #general>

	Metacello new
		baseline: 'SystemInteraction';
		repository: 'github://jecisc/SystemInteraction:v1.x.x/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> tasksLogger [
	<formula: #web>

	Metacello new
		baseline: 'TasksLogger';
		repository: 'github://juliangrigera/Tycho';
		onConflictUseLoaded;
		load.
]

{ #category : #formulas }
PackageFormulas class >> tealight [
	<formula: #web>

	Metacello new 
		repository: 'github://astares/Tealight/repository';
		baseline: 'Tealight';
		load 
]

{ #category : #formulas }
PackageFormulas class >> telePharoClient [
	<formula: #IDE>

	Metacello new
		baseline: 'TelePharo';
		repository: 'github://pharo-ide/TelePharo';
		load: 'Client'.
]

{ #category : #formulas }
PackageFormulas class >> telePharoServer [
	<formula: #IDE>

	Metacello new
		baseline: 'TelePharo';
		repository: 'github://pharo-ide/TelePharo';
		load: 'Server'.
]

{ #category : #formulas }
PackageFormulas class >> treeQuery [
	<formula: #general>

	Metacello new
		repository: 'github://JulienDelplanque/TreeQuery/src';
		baseline: 'TreeQuery';
		load.
]

{ #category : #formulas }
PackageFormulas class >> turbo [
	<formula: #IDE>

	Metacello new
		baseline: 'Turbo';
		repository: 'github://pavel-krivanek/Turbo';
		load.
]

{ #category : #formulas }
PackageFormulas class >> voyageEjdb [
	<formula: #databases>

	Metacello new 
		repository: 'github://pharo-nosql/voyage/mc';
		baseline: 'Voyage';
		load: 'ejdb tests'.
]

{ #category : #formulas }
PackageFormulas class >> voyageMongo [
	<formula: #databases>

	Metacello new 
		repository: 'github://pharo-nosql/voyage/mc';
		baseline: 'Voyage';
		load: 'mongo tests'.
]

{ #category : #formulas }
PackageFormulas class >> workflow [
	<formula: #science>

	Metacello new
		baseline: #Workflow;
		repository: 'github://Ducasse/Workflow:master/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> xPath [
	<formula: #XML>

	Metacello new
		baseline: 'XPath';
		repository: 'github://pharo-contributions/XML-XPath/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> xmlParser [
	<formula: #XML>

	Metacello new
		baseline: 'XMLParser';
		repository: 'github://pharo-contributions/XML-XMLParser/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> xmlParserHTML [
	<formula: #XML>

	Metacello new
		baseline: 'XMLParserHTML';
		repository: 'github://pharo-contributions/XML-XMLParserHTML/src';
		load.

]

{ #category : #formulas }
PackageFormulas class >> xmlParserStAX [
	<formula: #XML>

	Metacello new
		baseline: 'XMLParserStAX';
		repository: 'github://pharo-contributions/XML-XMLParserStAX/src';
		load.
]

{ #category : #formulas }
PackageFormulas class >> xmlWriter [
	<formula: #XML>

	Metacello new
		baseline: 'XMLWriter';
		repository: 'github://pharo-contributions/XML-XMLWriter/src';
		load.

]
