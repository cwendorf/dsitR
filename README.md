# `dsitR`

## Dynamic Social Impact Simulator

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.2-6666ff.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

`dsitR` is an R package for simulating Dynamic Social Impact Theory (DSIT). It models agents with multi-dimensional opinions who influence each other through customizable neighborhoods. The package includes modular tools for simulation, metrics, and visualization of cultural dynamics over time.

### Installation

This R package is not currently on CRAN, but the latest version can be installed and loaded using these R commands:

``` r
if (!require(remotes)) install.packages("remotes")
remotes::install_github("cwendorf/dsitrR")
library(dsitR)
```

If you do not wish a full install, the latest functions can be made available using these R commands:

``` r
source("http://raw.githubusercontent.com/cwendorf/dsitR/main/source-dsitR.R")
```

### Usage

This package contains a set of documents to explain and demonstrate its use:

- [Background](./docs/Background.md) - Theoretical background for simulating influence networks
- [Networks](./docs/Networks.md) - Agents and neighborhoods used to represent influence networks
- [Visualization](./docs/Visualization.md) - Graphs used to visualize the influence networks
- [Metrics](./docs/Metrics.md) - Metrics used to measure changes in influence networks
- [Analyses](./docs/Analyses.md) - Statistics used to analyze complex influence networks
- [Example](./docs/Example.md) - Sample code to analyze a simple influence network

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/dsitR/issues](https://github.com/cwendorf/dsitR/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://github.com/cwendorf](https://github.com/cwendorf)

### Citation

Wendorf, C. A. (2025). *dsitR: Dynamic social impact simulator* [R Package]. [https://github.com/cwendorf/dsitR](https://github.com/cwendorf/dsitR)
