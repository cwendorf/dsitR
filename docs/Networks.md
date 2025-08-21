## Networks

Agents and neighborhoods together define the social network in DSIT simulations: agents are the nodes, each with opinions and influence strength, and neighborhoods determine the edges, specifying who interacts with whom.

### Agents

Agents serve as individual entities that each hold one or more opinions with varying degrees of strength. In simulations, the distinction between opinion and strength is subtle but very important for modeling social dynamics:

Opinions:

- This represents what an agent believes or feels about a certain topic; think of it as the content of the agent’s social stance.
- It’s usually a value in some range, by default between -1 and 1.
- For example: -1 could represent strong disagreement, 0 neutrality, and 1 strong agreement.

Strength:

- This represents how strongly the agent holds that opinion; think of it as the confidence, stubbornness, or influence tied to the opinion.
- There is no universal rule for determining strength — it’s a design choice.
- It can influence how resistant the agent is to changing its opinion when interacting with others, or how much influence the agent has on others.
- By default, it ranges between 0.5 and 1.5, so some agents are “softer” (closer to 0.5) and some are “stronger” (closer to 1.5).

Example:

- Agent A has opinion1 = 0.8 and strength1 = 1.2 → Strongly agrees and is quite influential.
- Agent B has opinion1 = 0.8 and strength1 = 0.6 → Agrees as well, but is weaker and might change opinion more easily under social pressure.

### Neighborhoods

Neighborhoods define who interacts with (and thus possibly influences) each other. Some common models are available by default in `dsitR`. Together, these neighborhoods give the building blocks to simulate cultural dyanmics. 

Moore neighborhood (8 neighbors):

- Classic grid-based local interaction.
- Each agent interacts with the 8 surrounding cells (north, south, east, west, and diagonals).
- Good baseline model for local clustering and diffusion.

Von Neumann (4 neighbors):

- Only the orthogonal neighbors (N, S, E, W).
- Interactions are more constrained compared to Moore.
- Often used in cellular automata for simplicity.

Moore + outside:

- Standard 8 Moore neighbors plus one random “outside” contact from the whole population.
- Models mostly-local influence but with occasional long-range random exposure (e.g., media, internet).

Von Neumann + outside:

- Same as above, but base structure is 4 orthogonal neighbors.
- Slightly weaker local clustering, but still includes the random outsider.

Random k neighbors:

- Agent interacts with k randomly chosen others every step.
- Approximates a “mean field” model when k is large.
- Can represent highly mobile or globally connected populations.

Cluster neighbors (same row):

- Interaction limited to a row-based cluster (everyone with the same y-coordinate).
- Models segregated groups (like classrooms, offices, or local clubs).
- Still allows variation if cluster size is capped.

X-row neighbors (closest in x):

- Within the same row, picks the closest k agents in the x-direction.
- Creates line-like social structures (like houses along a street).
- Influence depends on physical proximity in one dimension.

Y-column neighbors (closest in y):

- Same idea as #7 but along the column.
- Think of apartment floors, office buildings, or towers where influence is vertical.

Long-range (farthest single neighbor):

- Each agent interacts with the farthest possible agent.
- Strongly anti-local: instead of clustering, this creates bridges across the population.
- Useful for modeling polarization across extremes.

Weighted distance (nearest 4 + farthest):

- Hybrid: takes several nearby contacts plus one faraway contact.
- Reflects “small-world” networks: most interactions are local, but occasional long jumps connect distant clusters.
- This structure can maintain clustering + diversity simultaneously.
