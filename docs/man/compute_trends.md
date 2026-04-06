# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Compute Trends

### Description

Calculates multiple opinion metrics—correlation, consolidation, diversity, and clustering—
for each time step in a simulation.

### Usage

```r
compute_trends(simulation)
```

### Arguments

- **`simulation`**: Data frame of simulation results including time and opinion columns.

### Value

Data frame where each row corresponds to a time step, containing all computed metrics.
