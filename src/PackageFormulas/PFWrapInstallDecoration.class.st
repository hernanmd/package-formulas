"
A hierarchy of wrapper for package formulas.

Subclasses should implement the method #valueInClass:withSelector: which receives a `Class` and a selector `Symbol` and answer (currently) a `String` with wrapped source code.
"
Class {
	#name : #PFWrapInstallDecoration,
	#superclass : #PFInstallDecoration,
	#category : #'PackageFormulas-Core'
}
