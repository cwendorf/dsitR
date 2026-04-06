# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Background

Simulation is often used to study Dynamic Social Impact because it allows researchers to model how opinions spread and stabilize in groups. 

- [Simulations](#simulations)
- [Details](#details)

---

### Simulations

Here’s how a simulation typically works:

1. Conduct the Simulation

    - A group of individuals is modeled (a "neighborhood"), usually as agents placed in a grid or network (e.g., a 2D lattice).
    - Each agent has a "state" or opinion (e.g., a binary value 0/1, categorical, or continuous).
    - Influence depends on the "learning rate" or susceptability of individuals, usually a probability that an individual adopts the majority opinion in their neighborhood.
    - At each time step, individuals update their opinions based on neighbors.

2. Visualize the Simulation

    - Often, visualization of the network, both early and later in the simulation is key.
    - Specifically, it points out key moments and highlights when and where big changes happen.
    - More generally, it turns raw data into simple visuals so trends are easy to spot.

3. Assess the Simulation

    - Over time, the simulation shows the four DSIT dynamics in each opinion (or even on average).
    - Metrics and graphs can be used to quantity and visualize the outcomes.
    - Often, graphs of changes in metrics over time are most useful.

### Details

- [Networks](./Networks.md): How agents and neighborhoods are defined, including opinion and strength parameters and the range of available neighborhood structures.
- [Visualization](./Visualization.md): The types of plots available: individual agent views, full-grid snapshots, force-directed networks, trend plots, and animations.
- [Metrics](./Metrics.md): How each DSIT metric (clustering, consolidation, correlation, diversity) is computed and interpreted.
- [Analyses](./Analyses.md): How to apply Principal Components Analysis and clustering to simulation output to uncover latent opinion structures.
