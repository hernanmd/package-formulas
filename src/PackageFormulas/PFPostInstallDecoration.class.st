Class {
	#name : #PFPostInstallDecoration,
	#superclass : #PFInstallationComponent,
	#category : #'PackageFormulas-Core'
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
