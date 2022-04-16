Extension { #name : #Pragma }

{ #category : #'*EnvironmentProfiles' }
Pragma class >> allIn: aClass [
	"Answer a <Collection> of <Pragma> found in aClass"
	
	^ aClass methods select: #hasPragma
]
