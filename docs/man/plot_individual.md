# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Plot a single agent and its neighbors

### Description

Visualizes a single focal agent on a grid along with its neighbors,
coloring agents according to an opinion value.

### Usage

```r
plot_individual(
  frame,
  neighborhood,
  id = NULL,
  coords = NULL,
  opinion = "opinion1",
  col_palette = NULL,
  edges = TRUE,
  focal_cex = 3
)
```

### Arguments

- **`frame`**: Data frame of agents at a single step, including x, y, and opinion columns.
- **`neighborhood`**: List of neighbors for each agent.
- **`id`**: Optional integer ID of the focal agent.
- **`coords`**: Optional numeric vector of length 2 specifying the (x, y) coordinates of the focal agent.
- **`opinion`**: Character name of the column in frame to use for coloring (default "opinion1").
- **`col_palette`**: Optional color palette passed to color_agents.
- **`edges`**: Logical; whether to draw lines connecting the focal agent to its neighbors (default TRUE).
- **`focal_cex`**: Numeric; size of the focal agent point (default 3).

### Value

Produces a plot.
