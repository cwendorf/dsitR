## Analyses

Applying Principal Components Analysis to Dynamic Social Impact Theory simulations helps uncover the key patterns and group structures hidden within complex, high-dimensional data.

### Overview

PCA can be conducted to reduce the complexity of multiple, likely correlated opinion variables (espeically at the end of the simulation) into a smaller set of uncorrelated components that capture the main patterns of variation.

- Dimensionality reduction: PCA compresses multiple, correlated opinion variables into a few uncorrelated principal components (PCs) that capture the main axes of opinion variation.

- Pattern discovery: Loadings reveal how original opinions combine into interpretable patterns like consensus or polarization.

- Clear visualization: Plotting agents in PC space and using scree plots clarifies structure that is hard to see in raw opinion dimensions.

- Clustering in reduced space: K-means on key PCs identifies opinion groups more robustly by removing noise and redundancy.

- Theoretical link: Emergent clusters in PC space map directly onto the opinion convergence patterns predicted by DSIT.

### Steps

These steps for the PCA make it easier to visualize and interpret the emergent opinion structures in the social network.

- Step 1 (Extract opinions): Select only one step of the simulation (often the final step) and extract the opinion variables.

- Step 2 (Perform PCA): Standardize the data to make all opinion variables comparable, run the PCA, and create component scores.

- Step 3 (Apply clustering): Check variance explained by each component and determine number of clusters.

- Step 4 (Visualize component distributions) : Plot density curves to see overall opinion variation.

- Step 5 (Compare components across clusters): Create plots of components grouped by clusters to visualize differences among groups.

- Step 6 (Visualize clustering in component space): Make a plot of components, coloring points by cluster membership to see cluster separation clearly.
