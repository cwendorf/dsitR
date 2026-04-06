# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Compute Clustering

### Description

Measures local similarity of agent opinions with their immediate neighbors on the grid
(radius = 1), returning per-opinion clustering values and an overall average.

### Usage

```r
compute_clustering(frame)
```

### Arguments

- **`frame`**: Data frame of agents with x, y, and opinion columns named "opinion1", "opinion2", etc.

### Value

Named numeric vector of clustering values for each opinion and the overall average.
