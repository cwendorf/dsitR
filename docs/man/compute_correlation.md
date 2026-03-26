# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Compute correlations across opinions

### Description

Calculates Spearman correlations between all pairs of opinion columns in a data frame.

### Usage

```r
compute_correlation(frame)
```

### Arguments

- **`frame`**: Data frame containing opinion columns named "opinion1", "opinion2", etc.

### Value

Named numeric vector of pairwise correlations, with an additional element average giving the mean correlation.
