# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Moore neighbors (8 neighbors)

### Description

Returns the indices of the 8 surrounding neighbors of an agent in a grid,
wrapping around the edges if necessary.

### Usage

```r
neighbors_moore(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters (currently unused).

### Value

Integer vector of neighbor agent IDs.
