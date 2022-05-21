Class {
	#name : #BaselineOfPackageFormulas,
	#superclass : #BaselineOf,
	#category : #BaselineOfPackageFormulas
}

{ #category : #baselines }
BaselineOfPackageFormulas >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'PackageFormulas';
				package: 'PackageFormulas-Tests'	with: [ spec requires: #(PackageFormulas) ].
			spec 
				group: 'Core' 						with: #('PackageFormulas');
				group: 'Tests' 						with: #('PackageFormulas' 'PackageFormulas-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
