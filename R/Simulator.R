# dsitR
## Simulator

#' Calculate influence on an agent from its neighbors
#'
#' Computes the weighted average of neighbors' opinions for a given agent, 
#' weighted by their opinion strengths.
#'
#' @param id Integer ID of the agent (currently not used in calculations, but included for consistency).
#' @param neighbors Integer vector of neighbor IDs.
#' @param agents Data frame of agents including opinion and strength columns.
#' @param opinions Integer number of opinion dimensions.
#'
#' @return Numeric vector of length `opinions` representing the weighted influence from neighbors.
#' @noRd
calculate_influence <- function(id, neighbors, agents, opinions){
  infl <- numeric(opinions)
  for(k in 1:opinions){
    infl[k] <- sum(agents[[paste0("opinion",k)]][neighbors] *
                   agents[[paste0("strength",k)]][neighbors]) /
               sum(agents[[paste0("strength",k)]][neighbors])
  }
  infl
}

#' Update an agent's opinions based on influence
#'
#' Adjusts an agent's opinions toward the weighted influence of its neighbors at a given rate,
#' keeping each opinion value within [-1, 1].
#'
#' @param agent_row A single row (data frame) representing the agent.
#' @param influence Numeric vector of influences on the agent for each opinion dimension.
#' @param rate Numeric learning rate or adjustment factor (default 0.2).
#' @param opinions Integer number of opinion dimensions.
#'
#' @return Updated agent row as a data frame.
#' @noRd
update_opinions <- function(agent_row, influence, rate=0.2, opinions){
  for(k in 1:opinions){
    agent_row[[paste0("opinion",k)]] <- agent_row[[paste0("opinion",k)]] +
      rate*(influence[k]-agent_row[[paste0("opinion",k)]])
    # keep in [-1,1]
    agent_row[[paste0("opinion",k)]] <- max(-1, min(1, agent_row[[paste0("opinion",k)]]))
  }
  agent_row
}

#' Run agent-based simulation
#'
#' Simulates the evolution of agent opinions over multiple time steps, 
#' updating each agent's opinions based on the influence of its neighbors.
#'
#' @param agents Data frame of agents with initial opinions and strengths.
#' @param neighborhood List of neighbors for each agent.
#' @param steps Integer number of simulation steps (default 30).
#' @param rate Numeric opinion update rate (default 0.4).
#'
#' @return Data frame of agents with updated opinions for each time step, including a `time` column.
#' @export
run_simulation <- function(agents, neighborhood, steps=30, rate=0.4) {
  
  opinions <- sum(grepl("^opinion", names(agents)))
  history <- vector("list", steps)
  
  for(t in 1:steps) {
    for(i in 1:nrow(agents)) {
      neigh_ids <- neighborhood[[i]]
      infl <- calculate_influence(i, neigh_ids, agents, opinions)
      agents[i, ] <- update_opinions(agents[i, ], infl, rate=rate, opinions=opinions)
    }
    
    history[[t]] <- cbind(agents, time=t)
  }
  
  do.call(rbind, history)
}
