# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Dynamic Social Impact Simulator

[![Minimal R Version](https://img.shields.io/badge/R%3E%3D-3.6.2-blue?style=for-the-badge)](https://cran.r-project.org/)
[![GitHub Release](https://img.shields.io/github/v/release/cwendorf/dsitR?style=for-the-badge)](https://github.com/cwendorf/dsitR/releases/latest)
[![Project Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)](https://www.repostatus.org/#active)

### Overview

`dsitR` is an R package for simulating Dynamic Social Impact Theory (DSIT). It models agents with multi-dimensional opinions who influence each other through customizable neighborhoods. The package includes modular tools for simulation, metrics, and visualization of cultural dynamics over time.

### Installation

This package is not currently available on CRAN. It can be installed directly from GitHub:

``` r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("cwendorf/dsitrR")
library(dsitR)
```

If you prefer not to install the package, you can load the current functions directly:

``` r
source("https://raw.githubusercontent.com/cwendorf/dsitR/main/source-dsitR.R")
```

### Usage

This package includes the following documentation:

- [Introduction](./docs/README.md): An introduction to the basic principles of DSIT.
- [Background](./docs/background/README.md): The theoretical background for simulating influence networks.
- [Reference](./docs/man/README.md): Documentation for all exported functions, including usauge, arguments, and return values.
- [Articles](./docs/vignettes/README.md): Simple and advanced examples of the use of `dsitR`.

### Citation

Wendorf, C. A. (2025). *dsitR: Dynamic social impact simulator* [R Package]. [https://github.com/cwendorf/dsitR](https://github.com/cwendorf/dsitR)
