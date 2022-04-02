Class {
	#name : #BaselineOfEnvironmentProfiles,
	#superclass : #BaselineOf,
	#category : #BaselineOfEnvironmentProfiles
}

{ #category : #baselines }
BaselineOfEnvironmentProfiles >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'EnvironmentProfiles';
				package: 'EnvironmentProfiles-Tests'	with: [ spec requires: #(EnvironmentProfiles) ].
			spec 
				group: 'Core' 						with: #('EnvironmentProfiles');
				group: 'Tests' 						with: #('EnvironmentProfiles' 'EnvironmentProfiles-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
