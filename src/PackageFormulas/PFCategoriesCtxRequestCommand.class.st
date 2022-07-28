Class {
	#name : #PFCategoriesCtxRequestCommand,
	#superclass : #PFCategoriesContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PFCategoriesCtxRequestCommand class >> defaultDescription [

	^ 'Request a formula in this category'
]

{ #category : #default }
PFCategoriesCtxRequestCommand class >> defaultName [

	^ 'Request'
]

{ #category : #executing }
PFCategoriesCtxRequestCommand >> execute [
	"Private - Open a Browser on the selected category"

	| categoryName |
	
	categoryName := self context categoriesList selectedItem.
	WebBrowser openOn: self applicationClass repositoryHttpAddress , '/issues/new/choose'.


]
