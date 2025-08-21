
## Neighborhoods

Neighborhoods define who interacts with (and thus possibly influences) each other. Some common models are available by default in `dsitR`. Together, these neighborhoods give the building blocks to simulate cultural dyanmics. 

### Moore neighborhood (8 neighbors)

- Classic grid-based local interaction.
- Each agent interacts with the 8 surrounding cells (north, south, east, west, and diagonals).
- Good baseline model for local clustering and diffusion.

### Von Neumann (4 neighbors)

- Only the orthogonal neighbors (N, S, E, W).
- Interactions are more constrained compared to Moore.
- Often used in cellular automata for simplicity.

### Moore + outside

- Standard 8 Moore neighbors plus one random “outside” contact from the whole population.
- Models mostly-local influence but with occasional long-range random exposure (e.g., media, internet).

### Von Neumann + outside

- Same as above, but base structure is 4 orthogonal neighbors.
- Slightly weaker local clustering, but still includes the random outsider.

### Random k neighbors

- Agent interacts with k randomly chosen others every step.
- Approximates a “mean field” model when k is large.
- Can represent highly mobile or globally connected populations.

### Cluster neighbors (same row)

- Interaction limited to a row-based cluster (everyone with the same y-coordinate).
- Models segregated groups (like classrooms, offices, or local clubs).
- Still allows variation if cluster size is capped.

### X-row neighbors (closest in x)

- Within the same row, picks the closest k agents in the x-direction.
- Creates line-like social structures (like houses along a street).
- Influence depends on physical proximity in one dimension.

### Y-column neighbors (closest in y)

- Same idea as #7 but along the column.
- Think of apartment floors, office buildings, or towers where influence is vertical.

### Long-range (farthest single neighbor)

- Each agent interacts with the farthest possible agent.
- Strongly anti-local: instead of clustering, this creates bridges across the population.
- Useful for modeling polarization across extremes.

### Weighted distance (nearest 4 + farthest)

- Hybrid: takes several nearby contacts plus one faraway contact.
- Reflects “small-world” networks: most interactions are local, but occasional long jumps connect distant clusters.
- This structure can maintain clustering + diversity simultaneously.
