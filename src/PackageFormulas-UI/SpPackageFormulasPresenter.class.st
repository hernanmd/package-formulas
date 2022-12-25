"
Abstract Spec2 class to group common behavior for Package Formula presenters.

"
Class {
	#name : #SpPackageFormulasPresenter,
	#superclass : #SpPresenter,
	#category : #'PackageFormulas-UI-UI'
}

{ #category : #accessing }
SpPackageFormulasPresenter >> labelHeight [

	^ self class labelHeight
]

{ #category : #defaults }
SpPackageFormulasPresenter >> toolbarHeight [

	^ self class toolbarHeight
]
