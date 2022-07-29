Extension { #name : #String }

{ #category : #'*PackageFormulas' }
String >> withoutNumbers [
	"Return a copy of the receiver with numbers removed "

	^ self reject: #isDigit
]
