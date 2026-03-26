# [`DEVISE`](https://github.com/cwendorf/DEVISE/)

## Run agent-based simulation

### Description

Simulates the evolution of agent opinions over multiple time steps,
updating each agent's opinions based on the influence of its neighbors.

### Usage

```r
run_simulation(agents, neighborhood, steps = 30, rate = 0.4)
```

### Arguments

- **`agents`**: Data frame of agents with initial opinions and strengths.
- **`neighborhood`**: List of neighbors for each agent.
- **`steps`**: Integer number of simulation steps (default 30).
- **`rate`**: Numeric opinion update rate (default 0.4).

### Value

Data frame of agents with updated opinions for each time step, including a time column.
