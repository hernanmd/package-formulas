Class {
	#name : #PackageFormulaWrapper,
	#superclass : #PackageFormulaInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #private }
PackageFormulaWrapper >> newLink [
	"Private - See superimplementor's comment"

	^ MetaLink new
		metaObject: self;
		selector: #wrapInClass:selector:;
		arguments: #(object selector);
		control: #instead.
]
