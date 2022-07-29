Class {
	#name : #PFCatCtxRequestCommand,
	#superclass : #PFCatContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFCatCtxRequestCommand class >> defaultDescription [

	^ 'Request a formula in this category'
]

{ #category : #default }
PFCatCtxRequestCommand class >> defaultName [

	^ 'Request'
]

{ #category : #executing }
PFCatCtxRequestCommand >> execute [
	"Private - Open a Browser on the selected category"

	| categoryName |
	
	categoryName := self context categoriesList selectedItem.
	WebBrowser openOn: self applicationClass repositoryHttpAddress , '/issues/new/choose'.


]
