"
A hierarchy of wrapper for package formulas.

Subclasses should implement the method #valueInClass:withSelector: which receives a `Class` and a selector `Symbol` and answer (currently) a `String` with wrapped source code.
"
Class {
	#name : #PackageFormulaWrapper,
	#superclass : #PackageFormulaInstallDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PackageFormulaWrapper >> addToPackageFormula: aPackageFormula [

	aPackageFormula addAroundDecoration: self
]

{ #category : #private }
PackageFormulaWrapper >> newFormulaLink [
	"Private - See superimplementor's comment"

	^ MetaLink new
		metaObject: self;
		selector: #valueInClass:withSelector:;
		arguments: #(object selector);
		control: #instead.
]

{ #category : #private }
PackageFormulaWrapper >> valueInClass: aClass withSelector: aSelector [
	" Private - "
]
