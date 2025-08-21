# dsitR
## Neighbors

### Create agents in a grid

create_agents <- function(rows, cols, opinions = 1, 
                          opinion_range = c(-1, 1), 
                          strength_range = c(0.5, 1.5)) {

  agents <- expand.grid(x = 1:cols, y = 1:rows)
  agents$id <- 1:(rows * cols)
  
  for (k in 1:opinions) {
    agents[[paste0("opinion", k)]] <- runif(nrow(agents), 
                                            min = opinion_range[1], 
                                            max = opinion_range[2])
    agents[[paste0("strength", k)]] <- runif(nrow(agents), 
                                             min = strength_range[1], 
                                             max = strength_range[2])
  }
  
  agents
}

### Create a neighborhood based on influence patterns

create_neighborhood <- function(agents, neighbors, params=list()) {
  lapply(1:nrow(agents), function(i) neighbors(i, agents, params))
}

.wrap <- function(pos, max_val) {
  if(pos < 1) return(max_val)
  if(pos > max_val) return(1)
  return(pos)
}

### Moore neighbors (8 neighbors)

neighbors_moore <- function(id, agents, params=list()){
  rows <- max(agents$y)
  cols <- max(agents$x)
  pos <- agents[id, c("x","y")]
  neighbors <- c()
  for(dx in -1:1){
    for(dy in -1:1){
      if(dx != 0 || dy != 0){
        nx <- .wrap(pos$x + dx, cols)
        ny <- .wrap(pos$y + dy, rows)
        neighbors <- c(neighbors, which(agents$x==nx & agents$y==ny))
      }
    }
  }
  neighbors
}

### Von Neumann neighbors (4 neighbors)

neighbors_vonneumann <- function(id, agents, params=list()){
  rows <- max(agents$y)
  cols <- max(agents$x)
  pos <- agents[id, c("x","y")]
  deltas <- list(c(0,1), c(1,0), c(0,-1), c(-1,0))
  neighbors <- c()
  for(delta in deltas){
    nx <- .wrap(pos$x + delta[1], cols)
    ny <- .wrap(pos$y + delta[2], rows)
    neighbors <- c(neighbors, which(agents$x==nx & agents$y==ny))
  }
  neighbors
}

### Moore + outside neighbors (1 outside neighbor)

neighbors_moore_outside <- function(id, agents, params=list()){
  neighbors <- neighbors_moore(id, agents, params)
  outside <- sample(setdiff(1:nrow(agents), c(id, neighbors)), 1)
  c(neighbors, outside)
}

### Von Neumann + outside neighbors (1 outside neighbor)

neighbors_vn_outside <- function(id, agents, params=list()){
  neighbors <- neighbors_vonneumann(id, agents, params)
  outside <- sample(setdiff(1:nrow(agents), c(id, neighbors)), 1)
  c(neighbors, outside)
}

### Random k neighbors neighbors (random neighbors)

neighbors_random_k <- function(id, agents, params=list()){
  k <- ifelse(is.null(params$k), 3, params$k)
  sample(setdiff(1:nrow(agents), id), min(k, nrow(agents)-1))
}

### Cluster neighbors (same row)

neighbors_cluster <- function(id, agents, params=list()){
  cluster_size <- ifelse(is.null(params$cluster_size), 3, params$cluster_size)
  cluster <- which(agents$y == agents$y[id])
  sample(setdiff(cluster, id), min(cluster_size, length(cluster)-1))
}

### X-row neighbors (closest in x)

neighbors_xrow <- function(id, agents, params=list()){
  k <- ifelse(is.null(params$k), 2, params$k)
  row <- which(agents$y == agents$y[id])
  dx <- abs(agents$x[row] - agents$x[id])
  row_neighbors <- setdiff(row, id)
  row_neighbors[order(dx[row_neighbors])[1:min(k,length(row_neighbors))]]
}

### Y-column neighbors (closest in y)

neighbors_ycol <- function(id, agents, params=list()){
  k <- ifelse(is.null(params$k), 2, params$k)
  col <- which(agents$x == agents$x[id])
  dy <- abs(agents$y[col] - agents$y[id])
  col_neighbors <- setdiff(col, id)
  col_neighbors[order(dy[col_neighbors])[1:min(k,length(col_neighbors))]]
}

### Long-range neighbors (farthest single neighbor)

neighbors_longrange <- function(id, agents, params=list()){
  others <- setdiff(1:nrow(agents), id)
  dists <- sqrt((agents$x[others]-agents$x[id])^2 + (agents$y[others]-agents$y[id])^2)
  others[which.max(dists)]
}

### Weighted distance neighbors (nearest 4 + farthest neighbors)

neighbors_weighted_distance <- function(id, agents, params=list()){
  others <- setdiff(1:nrow(agents), id)
  dists <- sqrt((agents$x[others]-agents$x[id])^2 + (agents$y[others]-agents$y[id])^2)
  nearest <- others[order(dists)][1:min(4,length(others))]
  farthest <- others[which.max(dists)]
  c(nearest, farthest)
}
