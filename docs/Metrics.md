## Metrics

Interpreting DSIT metrics properly is crucial, because each one is trying to capture a different aspect of how opinions evolve in simulations.

### Correlation (Between Dimensions)

Definition: 

- Correlation between different opinion dimensions across all agents (e.g., opinion1 vs. opinion2).
- Measures whether opinions tend to increase/decrease together globally.
- Range: –1 to +1 (Spearman implementation).

Interpretation:

- When ≈ 0 → independent dimensions (people’s stance on issue A tells you nothing about issue B).
- When > 0 → consolidation (dimensions align; if I know your stance on A, I can predict B).
- When < 0 → cross-cutting (polarization along one dimension tends to oppose the other).

Example: 

- High correlation indicates opinions are moving in sync across the population.
- If opinion1 = opinion2 for all agents, correlation = 1. 
- If opinion1 = -opinion2, correlation = -1.

Relevance: 

- Over time, DSIT predicts increasing correlations between different issues.
- Thus, ideological “bundles” form.

### Consolidation

Definition: 

- Measures how similar each agent is to its local neighbors (within a radius).
- For each opinion, compute the similarity of an agent’s opinion to its neighbors, average across all agents.
- Range: 0 to 1.

Interpretation:

- When = 1 → all agents are identical to their neighbors
- When = 0 → opinions are maximally different from neighbors

Example:

- High consolidation means opinions are locally aligned; multiple clusters can exist but within each cluster, opinions are similar.
- A 10x10 grid with three clusters of like-minded agents: each cluster has high local consolidation (~0.9), but globally there are differences among clusters.

Relevance: 

- Consolidation tends to increase over time, meaning that a dominant position forms.
- Groups of people form in a local areas.

### Diversity

Definition: 

- Variance of each opinion across all agents. 
- High variance means opinions are spread out.
- Range: 0 to ∞ (depends on opinion scale)

Interpretation:

- Low (≈0) → homogeneous (everyone thinks the same).
- Higher → high heterogeneity (population split across different positions).

Example:

- Captures global heterogeneity in opinions, but does not consider spatial proximity.
- If opinion1 ranges uniformly from -1 to 1 across agents, diversity ≈ 0.33.
- If everyone has opinion1 = 0.5, diversity = 0.

Relevance:

- Early → diversity is high (opinions are scattered).
- Later → diversity may collapse into clusters (lower variance within groups, but possibly multiple groups).

### Clustering

Definition: 
- Measures how spatially clustered similar opinions are on the grid. 
- For each agent, compare opinion differences to neighbors, then average across the grid.
- Range: 0 to 1

Interpretation:

- When = 1 → perfect spatial clustering: neighbors have identical opinions (local consensus)
- When = 0 → agents are maximally mixed with respect to opinion (local disagreement)

Example:

- A 10x10 grid where each quadrant has a uniform opinion and quadrants differ: high clustering (~0.9).
- A checkerboard pattern where neighbors have opposing opinions: low clustering (~0.1).

Relevance:

- Clustering tends to increase, since influence is local.
- But if you add random long-range ties, clusters may compete instead of stabilizing.
