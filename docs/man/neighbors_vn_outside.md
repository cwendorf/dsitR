# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Von Neumann neighbors plus one outside neighbor

### Description

Returns the indices of the 4 Von Neumann neighbors of an agent in a grid,
plus one additional random agent outside this neighborhood.

### Usage

```r
neighbors_vn_outside(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters passed to neighbors_vonneumann.

### Value

Integer vector of neighbor agent IDs including one outside neighbor.
