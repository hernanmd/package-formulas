"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestPackageFormulas',
	#superclass : 'PackageManifest',
	#category : 'PackageFormulas-Manifest',
	#package : 'PackageFormulas',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleAnySatisfyRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PFMetacelloQuerier #hasRPackageNamed: #false)) #'2022-08-12T06:55:03.216109+02:00') )
]

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleEquivalentSuperclassMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PackageFormulasScripterUI #initializeWindow: #false)) #'2022-08-12T06:47:26.838673+02:00') #(#(#RGMethodDefinition #(#PackageFormulasSelectorUI #initializeWindow: #false)) #'2022-08-12T06:47:26.838701+02:00') )
]

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleExcessiveMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'PackageFormulas class' #PackageFormulas)) #'2022-08-12T06:45:00.378095+02:00') )
]

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CompiledMethod #hasPackageFormula #false)) #'2022-08-12T06:45:00.441124+02:00') #(#(#RGMethodDefinition #(#PackageFormulasMainUI #handleMethodChange: #false)) #'2022-08-12T06:45:00.440974+02:00') #(#(#RGMethodDefinition #(#'PFWritingHelp class' #writingAFormula #true)) #'2022-08-12T07:01:53.125978+02:00') #(#(#RGMethodDefinition #(#'PFInstallHelp class' #howToUseTheAPI #true)) #'2022-08-12T07:01:53.125584+02:00') #(#(#RGMethodDefinition #(#'PFWritingHelp class' #writingAFormulaImplementation #true)) #'2022-08-12T07:01:53.125823+02:00') )
]

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'PFAbstractQuerier class' #findQuerierClass: #true)) #'2022-08-12T06:55:03.259492+02:00') )
]

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PackageFormulasMainUI #popMessage #false)) #'2022-08-12T06:47:26.782802+02:00') #(#(#RGMethodDefinition #(#PFInstallationComponent #install #false)) #'2022-08-12T06:47:26.782837+02:00') #(#(#RGMethodDefinition #(#PackageFormulasApp #start #false)) #'2022-08-12T06:47:26.782968+02:00') #(#(#RGMethodDefinition #(#PackageFormulasCategoriesUI #unselect #false)) #'2022-08-12T06:47:26.782858+02:00') #(#(#RGMethodDefinition #(#'PackageFormulasApp class' #updateBaseline #true)) #'2022-08-12T06:47:26.782944+02:00') #(#(#RGMethodDefinition #(#PackageFormulasMainUI #updateStatusBar #false)) #'2022-08-12T06:47:26.78287+02:00') #(#(#RGMethodDefinition #(#PackageFormulasMainUI #increaseFormulaCount #false)) #'2022-08-12T06:47:26.78298+02:00') #(#(#RGMethodDefinition #(#'PackageFormulasApp class' #updatePackage #true)) #'2022-08-12T06:47:26.783014+02:00') )
]

{ #category : 'code-critics' }
ManifestPackageFormulas class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PackageFormulaInfo #buildGitHubLink: #false)) #'2022-08-12T06:47:26.724908+02:00') #(#(#RGMethodDefinition #(#PFSingleInstallation #formattedSourceFor: #false)) #'2022-08-12T06:47:26.72461+02:00') #(#(#RGMethodDefinition #(#PFPreInstallDecoration #splitSourceOn: #false)) #'2022-08-12T06:47:26.724451+02:00') )
]
