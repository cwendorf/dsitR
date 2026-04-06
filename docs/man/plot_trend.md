# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Plot Trend

### Description

Visualizes the temporal evolution of a chosen opinion metric from the simulation trends.

### Usage

```r
plot_trend(trends, metric, opinion = "average", col = "blue", lwd = 2)
```

### Arguments

- **`trends`**: Data frame produced by compute_trends(), containing time and metric columns.
- **`metric`**: Character name of the metric to plot (e.g., "correlation", "consolidation", "diversity", "clustering").
- **`opinion`**: Character specifying which opinion to plot (default "average"). Can be "average", "opinion1", "opinion2", or pairwise (e.g., "opinion1_opinion2" for correlations).
- **`col`**: Color of the line and points (default "blue").
- **`lwd`**: Numeric line width (default 2).

### Value

Produces a plot.
