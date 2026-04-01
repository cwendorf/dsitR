# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Y-column neighbors (closest in y)

### Description

Returns the indices of the k closest neighbors in the same column based on y-coordinate distance.

### Usage

```r
neighbors_ycol(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters. params$k specifies the number of neighbors to select (default 2).

### Value

Integer vector of neighbor agent IDs closest in y within the same column.
