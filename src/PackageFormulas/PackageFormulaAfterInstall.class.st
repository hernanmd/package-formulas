Class {
	#name : #PackageFormulaAfterInstall,
	#superclass : #PackageFormulaInstallSTDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PackageFormulaAfterInstall >> addToPackageFormula: aPackageFormula [

	aPackageFormula addAfterDecoration: self
]

{ #category : #'instance creation' }
PackageFormulaAfterInstall >> newFormulaLink [
	"Private - See superimplementor's comment"

	^ MetaLink new
		metaObject: self;
		selector: #valueInClass:withSelector:;
		arguments: #(object selector);
		control: #after.
]

{ #category : #private }
PackageFormulaAfterInstall >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	self halt.
	^ String streamContents: [ : stream |
		stream
			<< 	(self next valueInClass: aClass withSelector: aSelector);
			<< self sourceCode ]
]
