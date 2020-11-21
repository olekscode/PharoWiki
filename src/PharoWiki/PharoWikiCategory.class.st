Class {
	#name : #PharoWikiCategory,
	#superclass : #Object,
	#instVars : [
		'url',
		'id',
		'title',
		'children'
	],
	#category : #'PharoWiki-Models'
}

{ #category : #adding }
PharoWikiCategory >> addChild: aPageOrSubcategory [
	children add: aPageOrSubcategory
]

{ #category : #accessing }
PharoWikiCategory >> children [
	^ children
]

{ #category : #'as yet unclassified' }
PharoWikiCategory >> generateTitle [
	"Generates title by splitting category id by camel case"
	title := ' ' join: id splitCamelCase
]

{ #category : #accessing }
PharoWikiCategory >> id [
	^ id
]

{ #category : #accessing }
PharoWikiCategory >> id: anObject [
	id := anObject
]

{ #category : #initialization }
PharoWikiCategory >> initialize [
	super initialize.
	children := OrderedCollection new.
]

{ #category : #accessing }
PharoWikiCategory >> title [
	^ title
]

{ #category : #accessing }
PharoWikiCategory >> title: anObject [
	title := anObject
]

{ #category : #accessing }
PharoWikiCategory >> url [
	^ url
]

{ #category : #accessing }
PharoWikiCategory >> url: anObject [
	url := anObject
]
