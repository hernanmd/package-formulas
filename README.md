[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

# Table of Contents

- [Description](#description)
- [Installation](#installation)
  - [Baseline String](#baseline-string)
- [Contribute](#contribute)
  - [Version management](#version-management)
- [License](#license)

# Description

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

# Usage

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)



