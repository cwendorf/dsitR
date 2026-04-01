# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Random k neighbors

### Description

Returns the indices of k randomly selected neighbors for an agent,
excluding the agent itself.

### Usage

```r
neighbors_random_k(id, agents, params = list())
```

### Arguments

- **`id`**: Integer ID of the agent.
- **`agents`**: A data frame of agents.
- **`params`**: A list of additional parameters. params$k specifies the number of neighbors (default 3).

### Value

Integer vector of randomly selected neighbor agent IDs.
