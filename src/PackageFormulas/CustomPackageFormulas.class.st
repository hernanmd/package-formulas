"
An alternative container for package formulas.
See class side for sample formulas.

To open a new UI for this alternative container:

```language=pharo
PackageFormulasApp new
	formulasContainer: CustomPackageFormulas;
	start
```

"
Class {
	#name : 'CustomPackageFormulas',
	#superclass : 'PackageFormulas',
	#category : 'PackageFormulas-Containers',
	#package : 'PackageFormulas',
	#tag : 'Containers'
}

{ #category : 'formulas' }
CustomPackageFormulas class >> reprexIt [
	<formula: #IDE>
	
	Metacello new	
		baseline: 'ReprexIt';	
		repository: 'github://hernanmd/reprex-it/src';	
		load 
]
