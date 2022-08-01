"
This decoration first write the previously code chain in its decoration chain (up to the `PackageFormula` installation expression), and then appends its source code.
"
Class {
	#name : #PFPostInstallDecoration,
	#superclass : #PFInstallationComponent,
	#category : #'PackageFormulas-Decorator'
}

{ #category : #accessing }
PFPostInstallDecoration >> sourceCode [
	" Private - See superimplementor's comment"

	^ String streamContents: [ : stream |
		stream
			<< self next sourceCode;
			cr;
			<< super sourceCode ]
]
