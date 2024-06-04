"
This decoration first write its source code, and then append the previously code chain in its decoration chain (up to the `PackageFormula` installation expression).
"
Class {
	#name : 'PFPreInstallDecoration',
	#superclass : 'PFInstallationComponent',
	#category : 'PackageFormulas-Decorator',
	#package : 'PackageFormulas',
	#tag : 'Decorator'
}

{ #category : 'accessing' }
PFPreInstallDecoration >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ :stream | 
		  stream << super sourceCode.
		  self splitSourceOn: stream.
		  stream
			  << Character cr;
			  << self next sourceCode ]
]

{ #category : 'accessing' }
PFPreInstallDecoration >> splitSourceOn: stream [
	"Private - If receiver's source code is not empty, divide it if there is no sentence separator. Otherwise do nothing."
	
	sourceCode ifEmpty: [ ^ self  ].
	(sourceCode endsWith: '.')
		ifFalse: [ stream << $. ].
]
