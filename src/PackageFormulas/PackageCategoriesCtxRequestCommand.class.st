Class {
	#name : #PackageCategoriesCtxRequestCommand,
	#superclass : #PackageCategoriesContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PackageCategoriesCtxRequestCommand class >> defaultDescription [

	^ 'Request a formula in this category'
]

{ #category : #default }
PackageCategoriesCtxRequestCommand class >> defaultName [

	^ 'Request'
]

{ #category : #executing }
PackageCategoriesCtxRequestCommand >> execute [
	"Private - Open a Browser on the selected category"

	| categoryName |
	
	categoryName := self context categoriesList selectedItem.
	WebBrowser openOn: self applicationClass repositoryHttpAddress , '/issues/new/choose'.


]
