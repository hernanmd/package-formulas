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
				package: 'PackageFormulas-UI' 		with: [ spec requires: #(PackageFormulas) ];
				package: 'PackageFormulas-Tests'	with: [ spec requires: #(PackageFormulas) ];

				group: 'Core' 						with: #('PackageFormulas');
				group: 'UI'							with: #('PackageFormulas-UI');
				group: 'Tests' 						with: #('PackageFormulas' 'PackageFormulas-Tests');
				group: 'default' 					with: #('Core' 'UI' 'Tests').
									
			spec
				for: #'pharo10.x'
				do: [ 
					spec package: 'PackageFormulas' with: [ spec requires: #('PackageFormulas-Help') ].
					spec package: 'PackageFormulas-Help' ].
			spec 
				for: #'pharo11.x' 
				do: [ 
					spec package: 'PackageFormulas' with: [ spec requires: #('PackageFormulas-Pharo11') ].
					spec package: 'PackageFormulas-Pharo11' ].
			spec
				for: #'pharo12.x'
				do: [ 
					spec package: 'PackageFormulas' with: [ spec requires: #('PackageFormulas-Pharo11') ].
					spec package: 'PackageFormulas-Pharo11' ] 
			]
]
