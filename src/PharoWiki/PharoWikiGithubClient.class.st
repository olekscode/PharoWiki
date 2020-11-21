Class {
	#name : #PharoWikiGithubClient,
	#superclass : #Object,
	#category : #'PharoWiki-Controllers'
}

{ #category : #'as yet unclassified' }
PharoWikiGithubClient class >> githubBranchName [
	^ 'master'
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient class >> githubFileBaseUrl [
	^ self githubRepositoryUrl, '/blob/', self githubBranchName
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient class >> githubOwnerName [
	^ 'pharo-open-documentation'
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient class >> githubRawFileBaseUrl [
	^ 'https://raw.githubusercontent.com/', self githubOwnerName, '/', self githubRepositoryName, '/', self githubBranchName
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient class >> githubRepositoryName [
	^ 'pharo-wiki'
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient class >> githubRepositoryUrl [
	^ 'https://github.com/', self githubOwnerName, '/', self githubRepositoryName
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient >> getRawTextFromUrl: aUrl [
	| client |
	
	client := ZnClient new
		url: aUrl;
   		get;
		yourself.
	
	^ client contents
]

{ #category : #'as yet unclassified' }
PharoWikiGithubClient >> loadPage: aPageId fromDirectory: aDirectoryName [
	| fileUrl rawFileUrl markdownText |
	
	fileUrl := self class githubFileBaseUrl, '/', aDirectoryName, '/', aPageId, '.md'.
	rawFileUrl := self class githubRawFileBaseUrl, '/', aDirectoryName, '/', aPageId, '.md'.
	
	markdownText := self getRawTextFromUrl: rawFileUrl.
	
	^ PharoWikiPage new
		url: fileUrl;
		id: aPageId;
		markdownText: markdownText;
		extractTitleFromMarkdown;
		yourself.
]
