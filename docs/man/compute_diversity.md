# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Compute opinion diversity

### Description

Calculates the variance of each opinion across all agents, with an additional average variance.

### Usage

```r
compute_diversity(frame)
```

### Arguments

- **`frame`**: Data frame containing opinion columns named "opinion1", "opinion2", etc.

### Value

Named numeric vector of per-opinion variance and overall average variance.
