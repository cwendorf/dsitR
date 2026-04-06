# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Create Neighborhood

### Description

Generates a list of neighbors for each agent according to a specified neighbor function.

### Usage

```r
create_neighborhood(agents, neighbors, params = list())
```

### Arguments

- **`agents`**: A data frame of agents, typically created by create_agents.
- **`neighbors`**: A function that returns the neighbors of a given agent.
- **`params`**: A list of additional parameters passed to the neighbors function.

### Value

A list where each element contains the neighbors of the corresponding agent.
