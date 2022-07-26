Extension { #name : #CompiledMethod }

{ #category : #'*PackageFormulas' }
CompiledMethod >> formula [
	"Answer the receiver's <PackageFormula>"

	| additionalMethodState |

	(additionalMethodState := self penultimateLiteral) isPackageFormula
		ifTrue: [ ^ additionalMethodState formula ]
		ifFalse: [ self halt. "Uninstall MetaLink" ]
]

{ #category : #'*PackageFormulas' }
CompiledMethod >> hasPackageFormula [
	"Answer <true> if the recevier contains a pragma defining a PackageFormula"

	^ self hasPragmaNamed: #formula:
]
