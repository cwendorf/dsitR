# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Create Agents

### Description

Generates a data frame representing agents positioned on a grid,
each with one or more opinions and corresponding strengths.

### Usage

```r
create_agents(
  rows,
  cols,
  opinions = 1,
  opinion_range = c(-1, 1),
  strength_range = c(0.5, 1.5)
)
```

### Arguments

- **`rows`**: Number of rows in the grid.
- **`cols`**: Number of columns in the grid.
- **`opinions`**: Number of opinions per agent.
- **`opinion_range`**: Numeric vector of length 2 specifying the range for opinions.
- **`strength_range`**: Numeric vector of length 2 specifying the range for opinion strengths.

### Value

A data frame with agent positions, IDs, opinions, and strengths.
