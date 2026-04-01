# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Moore neighbors plus one outside neighbor

### Description

Returns the indices of the 8 Moore neighbors of an agent in a grid,
plus one additional random agent outside this neighborhood.

### Usage

```r
neighbors_moore_outside(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters passed to neighbors_moore.

### Value

Integer vector of neighbor agent IDs including one outside neighbor.
