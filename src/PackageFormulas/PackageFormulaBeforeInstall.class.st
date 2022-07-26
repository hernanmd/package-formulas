Class {
	#name : #PackageFormulaBeforeInstall,
	#superclass : #PackageFormulaInstallSTDecoration,
	#category : #'PackageFormulas-Core'
}

{ #category : #adding }
PackageFormulaBeforeInstall >> addToPackageFormula: aPackageFormula [

	aPackageFormula addBeforeDecoration: self
]

{ #category : #'instance creation' }
PackageFormulaBeforeInstall >> newFormulaLink [
	"Private - See superimplementor's comment"

	^ MetaLink new
		metaObject: self;
		selector: #valueInClass:withSelector:;
		arguments: #(object selector);
		control: #before.
]

{ #category : #private }
PackageFormulaBeforeInstall >> valueInClass: aClass withSelector: aSelector [
	" Private - See superimplementor's comment"

	self halt.
	^ String streamContents: [ : stream |
		stream
			<< self sourceCode.
		(self sourceCode endsWithSubCollection: '.'	)
				ifFalse: [ stream << $. ].
		stream
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector) ]
]
