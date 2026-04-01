# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Compute local opinion consolidation

### Description

Measures how similar each agent's opinions are to its local neighbors,
using a radius-1 neighborhood on the grid. Returns per-opinion and average consolidation.

### Usage

```r
compute_consolidation(frame)
```

### Arguments

- **`frame`**: Data frame of agents with x, y, and opinion columns named "opinion1", "opinion2", etc.

### Value

Named numeric vector of consolidation values for each opinion and the overall average.
