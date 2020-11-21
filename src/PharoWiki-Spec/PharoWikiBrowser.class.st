Class {
	#name : #PharoWikiBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'page'
	],
	#category : #'PharoWiki-Spec'
}

{ #category : #specs }
PharoWikiBrowser class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #page;
		yourself
]

{ #category : #accessing }
PharoWikiBrowser class >> defaultTitle [
	^ 'Pharo Wiki'
]

{ #category : #accessing }
PharoWikiBrowser class >> initialExtent [
	^ 1000@700
]

{ #category : #specs }
PharoWikiBrowser class >> open [
	<example>
	self new openWithSpec.
]

{ #category : #initialization }
PharoWikiBrowser >> initializePresenters [
	super initializePresenters.
	
	page := self newText.
	self renderPage.
]

{ #category : #initialization }
PharoWikiBrowser >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter
		title: self class defaultTitle;
		initialExtent: self class initialExtent.
]

{ #category : #rendering }
PharoWikiBrowser >> renderPage [
	| url client text morphWriter document |
	
	url := 'https://raw.githubusercontent.com/pharo-open-documentation/pharo-wiki/master/General/Traits.md'.

	client := ZnClient new
		url: url;
   		get;
		yourself.
	
	text := client contents.
	
	morphWriter := PRRichTextComposer new.
	document := PRPearMicroDownState new parse: text.
	page text: (morphWriter start: document) 
]
