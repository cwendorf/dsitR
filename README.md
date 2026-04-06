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

If you do not wish a full install, the latest functions can be made available using this R command:

``` r
source("http://raw.githubusercontent.com/cwendorf/dsitR/main/source-dsitR.R")
```

### Usage

This package contains a set of materials to demonstrate its use:

- [Introduction](./docs/README.md): An introduction to the basic principles of DSIT.
- [Background](./docs/background/README.md): The theoretical background for simulating influence networks.
- [Reference](./docs/man/README.md): Documentation for all exported functions, including usauge, arguments, and return values.
- [Articles](./docs/vignettes/README.md): Simple and advanced examples of the use of `dsitR`.

### Contact

- GitHub Issues: [https://github.com/cwendorf/dsitR/issues](https://github.com/cwendorf/dsitR/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://github.com/cwendorf](https://github.com/cwendorf)

### Citation

Wendorf, C. A. (2025). *dsitR: Dynamic social impact simulator* [R Package]. [https://github.com/cwendorf/dsitR](https://github.com/cwendorf/dsitR)
