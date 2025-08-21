## Example

This is a basic example of a `dsitR` simulation. It demonstrates the various steps of simulating, visualizing, and assessing.

### Conduct the Simulation

Identity the simulation parameters to determine the size and length of the simulation.

```{r}
rows <- 8
cols <- 8
opinions <- 2
steps <- 50
rate <- 0.2
```

Create the neighborhood based on the parameters and the type of influence network.

```{r}
# Initialize agents and initial opinions
agents <- create_agents(rows=rows, cols=cols, opinions=opinions)

# Define the interactions among the agents
neighborhood <- create_neighborhood(agents, neighbors_moore)
```

Run and verify the simulation based on the neighborhood and parameters.

```{r}
# Run simulation using the neighborhood
result <- run_simulation(agents, neighborhood=neighborhood, steps=steps, rate=rate)

# View the first few rows of the simulation to see what is produced
head(result)
```

### Visualize the Simulation

Plot the neighborhood at specific steps (either with or without the connections among agents).

```{r}
# Plot Opinion 1 at the first step with edges
plot_step(
  subset(result, time == 1),
  neighborhood = neighborhood,
  opinion = "opinion1",
  edges = TRUE
)

# Plot Opinion 1 at the final step without edges
plot_step(
  subset(result, time == 50),
  neighborhood = neighborhood,
  opinion = "opinion1",
  edges = FALSE
)
```

Plot individuals at specific steps to highlight who they are influencing (and are influenced by).

```{r}
# Look at agent 42’s neighborhood at first step
frame <- subset(result, time == 1)
plot_individual(frame, neighborhood, id=42, opinion="opinion1")

# Look at agent 42’s neighborhood at final step
frame <- subset(result, time == 50)
plot_individual(frame, neighborhood, coords=c(2,6), opinion="opinion1")
```

Visualize the entire Simulation to unveil changes and patterns (with or without connections).

```{r}
# Animate all steps (with edges) for Opinion 1
animate_simulation(
  result,
  neighborhood = neighborhood,
  opinion = "opinion1",
  edges = TRUE
)

# Animate all steps (without edges) for Opinion 2
animate_simulation(
  result,
  neighborhood = neighborhood,
  opinion = "opinion2",
  edges = FALSE
)
```

### Assess the Simulation

Calculate metrics for specific steps in the simulation.

```{r}
# Calculate the metrics for the first step
frame <- subset(result, time == 1)
compute_metrics(frame)

# Calculate the metrics at the final step
frame <- subset(result, time == 50)
compute_metrics(frame)
```

Calculate and plot trends in the metrics.

```{r}
# Calculate the trends in the metrics
trends <- compute_trends(result)
names(trends)

# Plot the chosen metrics separately for opinions
plot_trend(trends, metric="correlation", opinion="opinion1_opinion2")
plot_trend(trends, metric="consolidation", opinion="opinion1")
plot_trend(trends, metric="diversity", opinion="opinion2")
```
