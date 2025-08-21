## Background

Dynamic Social Impact Theory (DSIT), developed by Bibb Latané and colleagues, explains how people influence each other over time and how culture forms.

### Description

Unlike the original Social Impact Theory (which focused on one-way influence), DSIT emphasizes that influence is two-way—people both affect and are affected by others around them. When people interact repeatedly, four main patterns tend to emerge:

- Consolidation – Opinions or behaviors become stronger and more uniform within a group.
- Clustering – People with similar views or behaviors group together.
- Correlation – Different opinions or traits start to link together (e.g., certain beliefs becoming associated).
- Continuing Diversity – Despite pressure to conform, some differences remain.

### An Example

Imagine a university dorm at the start of the school year. At first, students come in with all kinds of different music tastes. Some like pop, others rap, some rock, and a few classical.

- Consolidation: As students hang out, they talk about music, play songs in common spaces, and share playlists. Over time, more and more of them start listening to the same popular artists. Opinions and tastes become stronger and more uniform within the dorm.

- Clustering: Within the dorm, smaller groups start forming. The students who like indie bands often hang out together, while the rap fans gather in another group. People with similar tastes “cluster” around each other, reinforcing those preferences.

- Correlation: These clusters don’t just share music preferences—they start sharing other traits too. For example, the indie music group also becomes known for thrift-store fashion and activism, while the rap group is associated with basketball games and streetwear. Different opinions and behaviors become linked together.

- Continuing Diversity: Even though most of the dorm is into the same few big artists, and clusters form with their own distinct styles, a handful of students still hold onto their original tastes—like the one who keeps practicing violin or the few who stay loyal to heavy metal. These minority preferences survive despite the pressure to conform.

### Simulations

Simulation is often used to study these dynamics because it allows researchers to model how opinions spread and stabilize in groups. Here’s how such a simulation typically works:

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
