[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![GitHub Workflow Status](https://github.com/hernanmd/package-formulas/actions/workflows/CI.yml/badge.svg)](https://github.com/hernanmd/package-formulas/actions/workflows/CI.yml)
[![Coverage Status](https://coveralls.io/repos/github/hernanmd/package-formulas/badge.svg?branch=master)](https://coveralls.io/github/hernanmd/package-formulas?branch=master)

# Table of Contents

- [Description](#description)
- [Usage](#usage)
- [Installation](#installation)
  - [Baseline String](#baseline-string)
- [Contribute](#contribute)
  - [Version management](#version-management)
- [License](#license)

# Description

Package Formulas is a package manager front-end to simplify the installation and update of different software packages in [Pharo](https://www.pharo.org). It includes an installation mode with options to enable scriptable execution of formulas. Being agnostic mean that will detect installation specifications from multiple package installer implementations such as [Metacello](https://github.com/Metacello/metacello), Gofer and [Pakbot](https://github.com/pharo-pkg/pakbot).

- Package Formulas already includes a predefined set of categorized formulas.
- UI allows you to install packages in bulk.
- It is simple to create a script from selections.
- Scripts can be decorated with pre, post, and wrapper actions.
- You can request to list your own or recommended formulas by opening issues from the UI.
  - Then the package formula will be reviewed to avoid naming conflicts, and to prevent adding broken formulas.
  - The UI could be used with a custom container of your favorite, validated, isolated or private formulas.
- (Currently) it does not automatically collect packages from remote repositories or query on-line servers, however, you can easily jump to 
browse a selected project homepage.

# Usage

![package-formulas](https://user-images.githubusercontent.com/4825959/184296959-a2f25292-f6ec-4fde-b268-0c5d0f5a625c.gif)

# Installation

```smalltalk
EpMonitor disableDuring: [ 
        Metacello new   
                baseline: 'PackageFormulas';     
                onWarningLog;
                repository: 'github://hernanmd/package-formulas/src';      
                load ].
```

## Baseline String 

If you want to add the Badges to your Metacello Baselines or Configurations, copy and paste the following expression:

```smalltalk
        " ... "
        spec
                baseline: 'PackageFormulas' 
                with: [ spec repository: 'github://hernanmd/package-formulas/src' ];
        " ... "
```
# ToDo

- Add FormulaDescription.
- Add Mark as broken option.

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on Github.

If you have any suggestions for how this package could be improved, please get in touch or suggest an improvement using the GitHub issues page.

If you'd like to make some changes yourself, see the following:    


  - Fork this repository to your own GitHub account and then clone it to your local device
  - Do some modifications
  - Test.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# License
       
This software is licensed under the MIT License.

Copyright Hernán Morales Durand, 2022.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Authors

Hernán Morales Durand



