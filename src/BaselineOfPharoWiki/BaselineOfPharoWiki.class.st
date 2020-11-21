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
			baseline: 'pillar'
			with: [ spec repository: 'github://pillar-markup/pillar/src' ].
				
		"Packages"
		spec 
			package: 'PharoWiki';
			package: 'PharoWiki-Tests' with: [ spec requires: #('PharoWiki') ];
			package: 'PharoWiki-Spec' with: [ spec requires: #('PharoWiki' 'pillar') ] ]
]
