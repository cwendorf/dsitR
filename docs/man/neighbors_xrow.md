# [`dsitR`](https://github.com/cwendorf/dsitR/)

## X-Row Neighbors

### Description

Returns the indices of the k closest neighbors in the same row based on x-coordinate distance.

### Usage

```r
neighbors_xrow(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters. params$k specifies the number of neighbors to select (default 2).

### Value

Integer vector of neighbor agent IDs closest in x within the same row.
