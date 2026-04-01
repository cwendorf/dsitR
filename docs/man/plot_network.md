# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Plot force-directed network of agents

### Description

Visualizes agents as nodes in a force-directed network, showing edges based on a neighborhood structure.
Node colors represent an opinion value.

### Usage

```r
plot_network(
  frame,
  neighborhood,
  opinion = "opinion1",
  edge_col = "grey80",
  node_palette = NULL,
  node_size = 2,
  main = NULL,
  iterations = 200,
  k = 0.05,
  repel = 0.01
)
```

### Arguments

- **`frame`**: Data frame of agents at a single step, including opinion columns.
- **`neighborhood`**: List of neighbors for each agent.
- **`opinion`**: Character name of the column in frame to use for node coloring (default "opinion1").
- **`edge_col`**: Color of edges (default "grey80").
- **`node_palette`**: Optional color palette for nodes. If NULL, a blue-white-red palette of 100 colors is used.
- **`node_size`**: Numeric size of nodes (default 2).
- **`main`**: Optional main title for the plot.
- **`iterations`**: Number of iterations for force-directed layout (default 200).
- **`k`**: Attraction strength between connected nodes (default 0.05).
- **`repel`**: Repulsion strength between all nodes (default 0.01).

### Value

Produces a plot.
