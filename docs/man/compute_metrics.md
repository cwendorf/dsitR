# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Compute all opinion metrics for a step

### Description

Calculates multiple opinion metrics for a single time step, including
global correlations, local consolidation, global diversity, and spatial clustering.

### Usage

```r
compute_metrics(frame)
```

### Arguments

- **`frame`**: Data frame of agents at a single time step, with opinion columns named "opinion1", "opinion2", etc.

### Value

A named list containing:

- correlation - Spearman correlations between opinion pairs.
- consolidation - Local similarity with neighbors.
- diversity - Global opinion variance.
- clustering - Spatial clustering of opinions.
