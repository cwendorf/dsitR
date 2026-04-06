# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Cluster Neighbors

### Description

Returns the indices of neighbors in the same row (cluster) as the agent.

### Usage

```r
neighbors_cluster(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters. params$cluster_size specifies the number of neighbors to select (default 3).

### Value

Integer vector of neighbor agent IDs from the same row.
