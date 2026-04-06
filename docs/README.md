# [`dsitR`](https://github.com/cwendorf/dsitR/)

## Introduction

`dsitR` is an R package for simulating Dynamic Social Impact Theory (DSIT). It models agents with multi-dimensional opinions who influence each other through customizable neighborhoods, and provides tools for simulation, visualization, and analysis of cultural dynamics over time.

- [Overview](#overview)
- [Illustration](#illustration)
- [Resources](#resources)

---

### Overview

Unlike the original Social Impact Theory (which focused on one-way influence), DSIT emphasizes that influence is two-way -- people both affect and are affected by others around them. When people interact repeatedly, four main patterns tend to emerge:

- Consolidation: Opinions or behaviors become stronger and more uniform within a group.
- Clustering: People with similar views or behaviors group together.
- Correlation: Different opinions or traits start to link together (e.g., certain beliefs becoming associated).
- Continuing Diversity: Despite pressure to conform, some differences remain.

### Illustration

Imagine a university dorm at the start of the school year. At first, students come in with all kinds of different music tastes. Some like pop, others rap, some rock, and a few classical.

- Consolidation: As students hang out, they talk about music, play songs in common spaces, and share playlists. Over time, more and more of them start listening to the same popular artists. Opinions and tastes become stronger and more uniform within the dorm.

- Clustering: Within the dorm, smaller groups start forming. The students who like indie bands often hang out together, while the rap fans gather in another group. People with similar tastes “cluster” around each other, reinforcing those preferences.

- Correlation: These clusters don’t just share music preferences, they start sharing other traits too. For example, the indie music group also becomes known for thrift-store fashion and activism, while the rap group is associated with basketball games and streetwear. Different opinions and behaviors become linked together.

- Continuing Diversity: Even though most of the dorm is into the same few big artists, and clusters form with their own distinct styles, a handful of students still hold onto their original tastes—like the one who keeps practicing violin or the few who stay loyal to heavy metal. These minority preferences survive despite the pressure to conform.

### Resources

- [Background](./background/README.md): How simulations are used to study Dynamic Social Impact.
- [Reference](./man/README.md): Documentation for all exported functions, including usage, arguments, and return values.
- [Articles](./vignettes/README.md): Step-by-step walkthough examples used to demonstrate `dsitR`.
