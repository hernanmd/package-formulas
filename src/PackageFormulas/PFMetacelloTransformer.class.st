"
Can transform a `Metacello` expression in its `PackageFormula`, for example replacing #install message sends with #record.

"
Class {
	#name : #PFMetacelloTransformer,
	#superclass : #PFAbstractTransformer,
	#category : #'PackageFormulas-Core'
}

{ #category : #accessing }
PFMetacelloTransformer >> record [

	^ (RBParseTreeRewriter 
		replace: '``@anything load' 
		with: '``@anything record' 
		in: self packageFormulaAst body) formattedCode.

]
