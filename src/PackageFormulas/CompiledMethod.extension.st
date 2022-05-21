Extension { #name : #CompiledMethod }

{ #category : #'*PackageFormulas' }
CompiledMethod >> formulasDo: aFullBlockClosure [
	| selectorOrProperties |

	(selectorOrProperties := self penultimateLiteral) isMethodProperties
		ifTrue: [ selectorOrProperties formulasDo: aFullBlockClosure ]
]
