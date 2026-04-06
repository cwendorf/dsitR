# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Animate Simulation

### Description

Creates an animation of agents moving over time steps, optionally showing neighborhood connections
and coloring agents according to an opinion value.

### Usage

```r
animate_simulation(
  sim_result,
  neighborhood = NULL,
  opinion = "opinion1",
  delay = 0.2,
  edges = TRUE,
  col_palette = NULL
)
```

### Arguments

- **`sim_result`**: Data frame of simulation results including x, y, time, and opinion columns.
- **`neighborhood`**: Optional list of neighbors for each agent, as produced by a neighborhood function.
- **`opinion`**: Character name of the column in sim_result to use for coloring (default "opinion1").
- **`delay`**: Numeric; time delay between steps in seconds (default 0.2).
- **`edges`**: Logical; whether to draw lines connecting neighbors (default TRUE).
- **`col_palette`**: Optional color palette to use for mapping opinion values. If NULL, uses a blue-white-red palette of 100 colors.

### Value

Produces an animated plot.
