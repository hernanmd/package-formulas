Class {
	#name : #PackageCategoriesCtxBrowseCommand,
	#superclass : #PackageCategoriesContextualMenuCommand,
	#category : #'PackageFormulas-Commands'
}

{ #category : #default }
PackageCategoriesCtxBrowseCommand class >> defaultDescription [

	^ 'Browse selected category'
]

{ #category : #'accessing - defaults' }
PackageCategoriesCtxBrowseCommand class >> defaultIconName [

	^ #glamorousBrowse
]

{ #category : #default }
PackageCategoriesCtxBrowseCommand class >> defaultName [

	^ 'Browse'
]

{ #category : #executing }
PackageCategoriesCtxBrowseCommand >> execute [
	"Private - Inspect the selected pragma"

	| categoryName |
	
	categoryName := self context categoriesList selectedItem.
	SystemNavigation new browseMessageList: 
		((Pragma 
			allNamed: categoryName uncapitalized 
			in: self application formulasContainer class) collect: #method)
			name: 'Formulas for category: ' , categoryName


]
