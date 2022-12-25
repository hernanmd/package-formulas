"
This command open a Web Browser page to request a new formula to be included in the Package Formulas container.
"
Class {
	#name : #PFCategoriesCtxRequestCommand,
	#superclass : #PFCategoriesContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
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
	"Private - Open a Web Browser to request a new formula"

	| categoryName |
	
	categoryName := self context categoriesList selectedItem.
	WebBrowser openOn: self applicationClass repositoryHttpAddress , '/issues/new/choose'.


]
