# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Weighted distance neighbors (nearest 4 + farthest)

### Description

Returns the indices of the 4 nearest neighbors plus the single farthest neighbor
for a given agent based on Euclidean distance.

### Usage

```r
neighbors_weighted_distance(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters (currently unused).

### Value

Integer vector of neighbor agent IDs including the 4 nearest and 1 farthest.
