# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Long-range neighbor (farthest single neighbor)

### Description

Returns the index of the single agent that is farthest away from the given agent.

### Usage

```r
neighbors_longrange(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents with x and y positions.
- **`params`**: A list of additional parameters (currently unused).

### Value

Integer ID of the farthest neighbor agent.
