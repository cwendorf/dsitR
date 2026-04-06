# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Animate Network

### Description

Creates an animation of a force-directed network of agents over multiple time steps,
showing node colors based on an opinion value and edges based on a neighborhood structure.

### Usage

```r
animate_network(
  history,
  neighborhood,
  opinion = "opinion1",
  edge_col = "grey80",
  node_size = 2,
  iterations = 200,
  k = 0.05,
  repel = 0.01,
  delay = 0.2
)
```

### Arguments

- **`history`**: Data frame of simulation results including x, y, time, and opinion columns.
- **`neighborhood`**: List of neighbors for each agent.
- **`opinion`**: Character name of the column in history to use for node coloring (default "opinion1").
- **`edge_col`**: Color of edges (default "grey80").
- **`node_size`**: Numeric size of nodes (default 2).
- **`iterations`**: Number of iterations for the force-directed layout per frame (default 200).
- **`k`**: Attraction strength between connected nodes (default 0.05).
- **`repel`**: Repulsion strength between all nodes (default 0.01).
- **`delay`**: Numeric; time delay between frames in seconds (default 0.2).

### Value

Produces an animated plot.
