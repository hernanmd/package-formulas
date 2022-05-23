Class {
	#name : #PackageFormulaBeforeInstall,
	#superclass : #PackageFormulaInstallSTDecoration,
	#category : #'PackageFormulas-Core'
}

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

	^ String streamContents: [ : stream |
		stream
			<< self sourceCode.
		(self sourceCode endsWith: '.'	)
				ifFalse: [ stream << $. ].
		stream
			cr;
			<< 	(self next valueInClass: aClass withSelector: aSelector) ]
]
