"
Command to open a message list browser listing all the formulas which belong to the receiver's category.
"
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
	| formulasContainer formulaName |
	
	formulasContainer := self application formulasContainer.
	formulaName := 	aString.
	(aString allSatisfy: #isUppercase)
		ifFalse: [ formulaName := aString uncapitalized ].
	^ (PackageFormula allNamed: formulaName in: formulasContainer class) collect: #method.
]
