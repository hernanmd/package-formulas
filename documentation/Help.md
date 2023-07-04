

# Introduction

Package Formulas is a front-end for installing packages on a Pharo image. Each formula describes an installation. An installation contains one or multiple categories, along with a Pharo expression. Package Formulas does not assume any particular install manager, it could be Gofer, Metacello or a Pakbot expression.

The default formulas are found in the PackageFormulas class (on the class side), but nothing prevents you from defining your own formula container for your own packages.

In case you want to have your own packages listed in the application, you can simply request a Formula using the Request menu option from the contextual menu in a category

# Installing

## Install a Formula
	
```smalltalk
(PackageFormulas @ #neoJson) install.
```

# Add a wrapper and install

```smalltalk
(PackageFormulas for: #IDE) second
 	addDecoration: (PFBackgroundWrapper new);
 	install.
```

# Add multiple wrappers and install

```smalltalk
(PackageFormulas @ #neoJson)
		addDecoration: (PFBackgroundWrapper new);
		addDecoration: (PFDisableMonitorWrapper new);
		addDecoration: (PFPostInstallDecoration new sourceCode: 'self inform: 'Finished');
		yourself
```


# Querying

Most of the functionality is intended to be intuitive through the Package Formulas UI, but can also be used through the PackageFormula API. In that case, some examples are:

```smalltalk
(PackageFormulas @ #neoJson) categories.
```

# Writing a formula

A formula can be written by defining a pragma and the installation expression, for example:

```smalltalk
myCoolPackage
	<formula: #blockchain>
	
	Metacello new
		repository: '';
		baseline: ...;
		load
```

The default place to compile a formula is the class PackageFormulas (class side). This class acts as a "repository" of package formulas, although any class can be configured to be used  as a repository. Compiling the method will make the formula visible to the Package Formulas UI tool, which by default uses the PackageFormulas class.

There is no need to return anything, nor to define additional installation tasks as many of them can be handled by the Package Formulas installed.

A formula can belong to multiple categories, like this:

```smalltalk
myCoolFormula

	<formula: #GIS>
 	<formula: #science>
	
 	Metacello new
 		baseline: ''''MyCoolProject'''';
 		repository: ''''github://...'''';
 		load'
```

and it will be listed in both categories of the Package Formulas UI.

## Implementation Details

In its most basic form in the current implementation, a PackageFormula is simply a CompiledMethod that includes a Pragma identified by the name "formula:", and an argument specifying a category. Future implementations could avoid using Pragmas, however the API will not change and the UI will maintain its functionality.
