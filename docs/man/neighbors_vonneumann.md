# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Von Neumann neighbors (4 neighbors)

### Description

Returns the indices of the 4 adjacent neighbors (up, down, left, right)
of an agent in a grid, wrapping around the edges if necessary.

### Usage

```r
neighbors_vonneumann(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters (currently unused).

### Value

Integer vector of neighbor agent IDs.
