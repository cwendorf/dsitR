# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Introduction

`dsitR` is an R package for simulating Dynamic Social Impact Theory (DSIT). It models agents with multi-dimensional opinions who influence each other through customizable neighborhoods, and provides tools for simulation, visualization, and analysis of cultural dynamics over time.

- [Articles](#articles)
- [Examples](#examples)
- [Reference](#reference)

---

### Articles

- [Overview](./articles/Overview.md): The four core DSIT dynamics, and how simulations are used to study them.
- [Networks](./articles/Networks.md): How agents and neighborhoods are defined, including opinion and strength parameters and the range of available neighborhood structures.
- [Visualization](./articles/Visualization.md): The types of plots available: individual agent views, full-grid snapshots, force-directed networks, trend plots, and animations.
- [Metrics](./articles/Metrics.md): How each DSIT metric (clustering, consolidation, correlation, diversity) is computed and interpreted.
- [Analyses](./articles/Analyses.md): How to apply Principal Components Analysis and clustering to simulation output to uncover latent opinion structures.

### Examples

- [Simple Example](./vignettes/SimpleExample.md): A step-by-step walkthrough using a small grid with two opinions and standard grid plots.
- [Advanced Example](./vignettes/AdvancedExample.md): An extended example with a larger network, force-directed visualization, PCA, and cluster analysis.

### Reference

- [Reference](./man/README.md): Complete documentation for all exported functions, organized by category (core simulation, neighbor structures, metrics, visualization).
