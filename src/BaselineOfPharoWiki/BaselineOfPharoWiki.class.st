Class {
	#name : #BaselineOfPharoWiki,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoWiki
}

{ #category : #baselines }
BaselineOfPharoWiki >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'Pillar'
			with: [ spec repository: 'github://pillar-markup/pillar:dev-8/src' ].
				
		"Packages"
		spec 
			package: 'PharoWiki';
			package: 'PharoWiki-Tests' with: [ spec requires: #('PharoWiki') ];
			package: 'PharoWiki-Spec' with: [ spec requires: #('PharoWiki' 'Pillar') ] ]
]
