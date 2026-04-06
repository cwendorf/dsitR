# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Plot Step

### Description

Visualizes agents on a grid for a single time step, optionally showing their neighborhood connections
and coloring agents according to an opinion value.

### Usage

```r
plot_step(
  frame,
  neighborhood = NULL,
  opinion = "opinion1",
  main = NULL,
  edges = TRUE,
  col_palette = NULL
)
```

### Arguments

- **`frame`**: Data frame of agents at a single step, including x, y, and opinion columns.
- **`neighborhood`**: Optional list of neighbors for each agent, as produced by a neighborhood function.
- **`opinion`**: Character name of the column in frame to use for coloring (default "opinion1").
- **`main`**: Optional main title for the plot. If NULL, uses the step number from frame$time.
- **`edges`**: Logical; whether to draw lines connecting neighbors (default TRUE).
- **`col_palette`**: Optional color palette passed to color_agents.

### Value

Produces a plot.
