Class {
	#name : #PharoWikiPage,
	#superclass : #PharoWikiCategory,
	#instVars : [
		'markdownText'
	],
	#category : #'PharoWiki-Models'
}

{ #category : #'as yet unclassified' }
PharoWikiPage >> extractTitleFromMarkdown [
	markdownText lines
		detect: [ :line | line trimBoth beginsWith: '# ' ]
		ifFound: [ :line | title := line copyWithoutFirst trimLeft ].
]

{ #category : #accessing }
PharoWikiPage >> markdownText [
	^ markdownText
]

{ #category : #accessing }
PharoWikiPage >> markdownText: anObject [
	markdownText := anObject
]
