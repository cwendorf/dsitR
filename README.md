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

- [Background](./docs/Background.md) - Theoretical background of DSIT and its simulation
- [Neighborhoods](./docs/Neighborhoods.md) - Models used to represent influence networks
- [Metrics](./docs/Metrics.md) - Statistics used to measure changes in influence networks
- [Visualization](./docs/Visualization.md) - Graphs used to visualize the influence networks
- [Example](./docs/Example.md) - Sampel code to analyze a simple example

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/dsitR/issues](https://github.com/cwendorf/dsitR/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://github.com/cwendorf](https://github.com/cwendorf)

### Citation

Wendorf, C. A. (2025). *dsitR: Dynamic social impact simulator* [R Package]. [https://github.com/cwendorf/dsitR](https://github.com/cwendorf/dsitR)
