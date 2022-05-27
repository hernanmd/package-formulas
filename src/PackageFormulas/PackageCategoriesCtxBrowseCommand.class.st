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
	"Private - Answer a <Collection> of <CompiledMethod> including a pragma named aString.
	See PackageFormula for rules for naming formulas through pragmas"
	| formulasContainer formulas |
	
	formulasContainer := self application formulasContainer.
	formulas := (aString allSatisfy: #isUppercase)
		ifFalse: [ 
			PackageFormula 
				allNamed: aString uncapitalized 
				in: formulasContainer class ]
		ifTrue: [ 
			PackageFormula 
				allNamed: aString
				in: formulasContainer class
			 ].
	^ formulas collect: #method.
]
