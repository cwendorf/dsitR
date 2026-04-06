# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Compute Diversity

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
