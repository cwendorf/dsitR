# dsitR
## Neighbors

#' Create agents in a grid
#'
#' Generates a data frame representing agents positioned on a grid, 
#' each with one or more opinions and corresponding strengths.
#'
#' @param rows Number of rows in the grid.
#' @param cols Number of columns in the grid.
#' @param opinions Number of opinions per agent.
#' @param opinion_range Numeric vector of length 2 specifying the range for opinions.
#' @param strength_range Numeric vector of length 2 specifying the range for opinion strengths.
#'
#' @return A data frame with agent positions, IDs, opinions, and strengths.
#' @export
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

#' Create a neighborhood based on influence patterns
#'
#' Generates a list of neighbors for each agent according to a specified neighbor function.
#'
#' @param agents A data frame of agents, typically created by \code{create_agents}.
#' @param neighbors A function that returns the neighbors of a given agent.
#' @param params A list of additional parameters passed to the neighbors function.
#'
#' @return A list where each element contains the neighbors of the corresponding agent.
#' @export
create_neighborhood <- function(agents, neighbors, params=list()) {
  lapply(1:nrow(agents), function(i) neighbors(i, agents, params))
}

#' Wrap a position within bounds
#'
#' Ensures a position stays within the range 1 to max_val by wrapping around.
#'
#' @param pos Position value (numeric).
#' @param max_val Maximum allowed value.
#'
#' @return Wrapped position within 1 to max_val.
#' @noRd
.wrap <- function(pos, max_val) {
  if(pos < 1) return(max_val)
  if(pos > max_val) return(1)
  return(pos)
}

#' Moore neighbors (8 neighbors)
#'
#' Returns the indices of the 8 surrounding neighbors of an agent in a grid,
#' wrapping around the edges if necessary.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters (currently unused).
#'
#' @return Integer vector of neighbor agent IDs.
#' @export
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

#' Von Neumann neighbors (4 neighbors)
#'
#' Returns the indices of the 4 adjacent neighbors (up, down, left, right) 
#' of an agent in a grid, wrapping around the edges if necessary.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters (currently unused).
#'
#' @return Integer vector of neighbor agent IDs.
#' @export
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

#' Moore neighbors plus one outside neighbor
#'
#' Returns the indices of the 8 Moore neighbors of an agent in a grid, 
#' plus one additional random agent outside this neighborhood.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters passed to \code{neighbors_moore}.
#'
#' @return Integer vector of neighbor agent IDs including one outside neighbor.
#' @export
neighbors_moore_outside <- function(id, agents, params=list()){
  neighbors <- neighbors_moore(id, agents, params)
  outside <- sample(setdiff(1:nrow(agents), c(id, neighbors)), 1)
  c(neighbors, outside)
}

#' Von Neumann neighbors plus one outside neighbor
#'
#' Returns the indices of the 4 Von Neumann neighbors of an agent in a grid,
#' plus one additional random agent outside this neighborhood.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters passed to \code{neighbors_vonneumann}.
#'
#' @return Integer vector of neighbor agent IDs including one outside neighbor.
#' @export
neighbors_vn_outside <- function(id, agents, params=list()){
  neighbors <- neighbors_vonneumann(id, agents, params)
  outside <- sample(setdiff(1:nrow(agents), c(id, neighbors)), 1)
  c(neighbors, outside)
}

#' Random k neighbors
#'
#' Returns the indices of k randomly selected neighbors for an agent,
#' excluding the agent itself.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents.
#' @param params A list of additional parameters. `params$k` specifies the number of neighbors (default 3).
#'
#' @return Integer vector of randomly selected neighbor agent IDs.
#' @export
neighbors_random_k <- function(id, agents, params=list()){
  k <- ifelse(is.null(params$k), 3, params$k)
  sample(setdiff(1:nrow(agents), id), min(k, nrow(agents)-1))
}

#' Cluster neighbors (same row)
#'
#' Returns the indices of neighbors in the same row (cluster) as the agent.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters. `params$cluster_size` specifies the number of neighbors to select (default 3).
#'
#' @return Integer vector of neighbor agent IDs from the same row.
#' @export
neighbors_cluster <- function(id, agents, params=list()){
  cluster_size <- ifelse(is.null(params$cluster_size), 3, params$cluster_size)
  cluster <- which(agents$y == agents$y[id])
  sample(setdiff(cluster, id), min(cluster_size, length(cluster)-1))
}

#' X-row neighbors (closest in x)
#'
#' Returns the indices of the k closest neighbors in the same row based on x-coordinate distance.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters. `params$k` specifies the number of neighbors to select (default 2).
#'
#' @return Integer vector of neighbor agent IDs closest in x within the same row.
#' @export
neighbors_xrow <- function(id, agents, params=list()){
  k <- ifelse(is.null(params$k), 2, params$k)
  row <- which(agents$y == agents$y[id])
  dx <- abs(agents$x[row] - agents$x[id])
  row_neighbors <- setdiff(row, id)
  row_neighbors[order(dx[row_neighbors])[1:min(k,length(row_neighbors))]]
}

#' Y-column neighbors (closest in y)
#'
#' Returns the indices of the k closest neighbors in the same column based on y-coordinate distance.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters. `params$k` specifies the number of neighbors to select (default 2).
#'
#' @return Integer vector of neighbor agent IDs closest in y within the same column.
#' @export
neighbors_ycol <- function(id, agents, params=list()){
  k <- ifelse(is.null(params$k), 2, params$k)
  col <- which(agents$x == agents$x[id])
  dy <- abs(agents$y[col] - agents$y[id])
  col_neighbors <- setdiff(col, id)
  col_neighbors[order(dy[col_neighbors])[1:min(k,length(col_neighbors))]]
}

#' Long-range neighbor (farthest single neighbor)
#'
#' Returns the index of the single agent that is farthest away from the given agent.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters (currently unused).
#'
#' @return Integer ID of the farthest neighbor agent.
#' @export
neighbors_longrange <- function(id, agents, params=list()){
  others <- setdiff(1:nrow(agents), id)
  dists <- sqrt((agents$x[others]-agents$x[id])^2 + (agents$y[others]-agents$y[id])^2)
  others[which.max(dists)]
}

#' Weighted distance neighbors (nearest 4 + farthest)
#'
#' Returns the indices of the 4 nearest neighbors plus the single farthest neighbor
#' for a given agent based on Euclidean distance.
#'
#' @param id Integer ID of the agent.
#' @param agents A data frame of agents with `x` and `y` positions.
#' @param params A list of additional parameters (currently unused).
#'
#' @return Integer vector of neighbor agent IDs including the 4 nearest and 1 farthest.
#' @export
neighbors_weighted_distance <- function(id, agents, params=list()){
  others <- setdiff(1:nrow(agents), id)
  dists <- sqrt((agents$x[others]-agents$x[id])^2 + (agents$y[others]-agents$y[id])^2)
  nearest <- others[order(dists)][1:min(4,length(others))]
  farthest <- others[which.max(dists)]
  c(nearest, farthest)
}
