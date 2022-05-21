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
	SystemNavigation new 
		browseMessageList: (self messageListForCategory: categoryName)
		name: 'Formulas for category: ' , categoryName


]

{ #category : #private }
PackageCategoriesCtxBrowseCommand >> messageListForCategory: aString [ 

	| formulasContainer pragmas |
	
	formulasContainer := self application formulasContainer.
	pragmas := aString isUppercase
		ifFalse: [ 
			Pragma 
				allNamed: aString uncapitalized 
				in: formulasContainer class ]
		ifTrue: [ 
			Pragma 
				allNamed: aString 
				in: formulasContainer class
			 ].
	^ pragmas collect: #method.
]
