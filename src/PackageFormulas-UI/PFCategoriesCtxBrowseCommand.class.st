"
Command to open a message list browser listing all the formulas which belong to the receiver's category.
"
Class {
	#name : #PFCategoriesCtxBrowseCommand,
	#superclass : #PFCategoriesContextualMenuCommand,
	#category : #'PackageFormulas-UI-Commands'
}

{ #category : #default }
PFCategoriesCtxBrowseCommand class >> defaultDescription [

	^ 'Browse selected category'
]

{ #category : #default }
PFCategoriesCtxBrowseCommand class >> defaultName [

	^ 'Browse'
]

{ #category : #executing }
PFCategoriesCtxBrowseCommand >> execute [
	"Private - Open a Browser on the selected category"

	| categoryName |
	
	categoryName := self context categoriesList selectedItem.
	SystemNavigation new 
		browseMessageList: (self messageListForCategory: categoryName)
		name: 'Formulas for category: ' , categoryName


]

{ #category : #private }
PFCategoriesCtxBrowseCommand >> messageListForCategory: aString [ 
	"Private - Answer a <Collection> of <CompiledMethod> including a pragma named aString.
	See PackageFormula for rules for naming formulas through pragmas"
	| formulasContainer formulaName |
	
	formulasContainer := self application formulasContainer.
	formulaName := 	aString.
	(aString allSatisfy: #isUppercase)
		ifFalse: [ formulaName := aString uncapitalized ].
	^ (formulasContainer 
			allNamed: formulaName 
			in: formulasContainer class) 
				collect: #method.
]
