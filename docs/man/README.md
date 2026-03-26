# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Reference

This directory contains the complete function reference for `dsitR`, converted from the package's Rd documentation. Functions are organized below by category.

- [Core Simulation](#core-simulation)
- [Neighbor Structures](#neighbor-structures)
- [Metrics and Statistics](#metrics-and-statistics)
- [Visualization](#visualization)

---

### Core Simulation

- [create_agents](create_agents.md): Create agents in a grid
- [create_neighborhood](create_neighborhood.md): Create a neighborhood based on influence patterns
- [run_simulation](run_simulation.md): Run agent-based simulation

### Neighbor Structures

- [neighbors_cluster](neighbors_cluster.md): Cluster neighbors (same row)
- [neighbors_longrange](neighbors_longrange.md): Long-range neighbor (farthest single neighbor)
- [neighbors_moore](neighbors_moore.md): Moore neighbors (8 neighbors)
- [neighbors_moore_outside](neighbors_moore_outside.md): Moore neighbors plus one outside neighbor
- [neighbors_random_k](neighbors_random_k.md): Random k neighbors
- [neighbors_vonneumann](neighbors_vonneumann.md): Von Neumann neighbors (4 neighbors)
- [neighbors_vn_outside](neighbors_vn_outside.md): Von Neumann neighbors plus one outside neighbor
- [neighbors_weighted_distance](neighbors_weighted_distance.md): Weighted distance neighbors (nearest 4 + farthest)
- [neighbors_xrow](neighbors_xrow.md): X-row neighbors (closest in x)
- [neighbors_ycol](neighbors_ycol.md): Y-column neighbors (closest in y)

### Metrics and Statistics

- [compute_metrics](compute_metrics.md): Compute all opinion metrics for a step
- [compute_trends](compute_trends.md): Compute opinion metrics over all simulation steps
- [compute_clustering](compute_clustering.md): Compute spatial clustering of opinions
- [compute_consolidation](compute_consolidation.md): Compute local opinion consolidation
- [compute_correlation](compute_correlation.md): Compute correlations across opinions
- [compute_diversity](compute_diversity.md): Compute opinion diversity

### Visualization

- [plot_step](plot_step.md): Plot all agents at a single step
- [plot_individual](plot_individual.md): Plot a single agent and its neighbors
- [plot_network](plot_network.md): Plot force-directed network of agents
- [plot_trend](plot_trend.md): Plot the trend of a specific metric over time
- [animate_network](animate_network.md): Animate force-directed network over time
- [animate_simulation](animate_simulation.md): Animate simulation of agents over time
- [color_agents](color_agents.md): Color agents based on values
