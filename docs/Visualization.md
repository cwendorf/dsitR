
## Visualization

Visualization helps turn complex simulation results into clear, interpretable images and animations, making it easier to see how opinions spread, clusters form, and diversity or consensus emerges over time.

### Grid (Lattice) Plots

In grid plots, agents are placed on a fixed 2D grid (x,y coordinates), where distance in the plot corresponds to physical/social immediacy. These have a number of uses, depending on what the researcher wishes to highlight.

Highlighting one agent and its neighbors:

- Focuses on a single "focal" agent and the immediate neighborhood influencing its opinion.
- Displays the focal agent with a larger marker or distinct color to make it stand out.
- Links connect the focal agent to its neighbors, illustrating the local social network.
- Helps reveal whether the agent is embedded in a like-minded cluster or positioned along a boundary between different opinions.
- Useful for understanding micro-level interactions driving opinion change before looking at system-wide patterns.

Showing all agents at a single time step:

- Provides a snapshot of the entire population at one point in time.
- Each agent is displayed on a grid with colors representing current opinions, making spatial or network clusters easy to spot.
- Optional lines (edges) show links between agents and their neighbors, giving structure to the social network.
- Enables quick identification of consensus regions, minority clusters, or isolated individuals.
- Particularly helpful when comparing snapshots at different time steps to see how clustering and diversity emerge over time.

Animating the simulation over time:

- Links together multiple time steps into a continuous animation.
- Shows how opinions evolve step-by-step, allowing viewers to watch clustering and consensus unfold dynamically.
- Colors update to reflect changing opinions, while edges continue to show the network structure.
- Useful for identifying when key transitions occur, such as the moment small clusters merge into a larger consensus.
- Makes it easier to communicate dynamic processes to audiences who may struggle with interpreting statistics.

### Force-Directed Graphs

In force-directed graphs, agents are nodes, connected by edges to their neighbors. The layout algorithm (spring/force-directed) tries to position connected nodes close together. Here, node placement is abstract, showing structural closeness rather than physical location.

- Highlights clusters, bridges, and central agents that may not be obvious in raw data or spatial layouts.
- Works for any network based on friendships, communication, or influence, even when ties don’t follow physical space.
- By animating or comparing multiple snapshots, it shows how relationships and clusters change as the simulation progresses.
- Handles overlapping communities and irregular network shapes better than grid-based layouts.
