# dsitR
## Simulator

### Influence

calculate_influence <- function(id, neighbors, agents, opinions){
  infl <- numeric(opinions)
  for(k in 1:opinions){
    infl[k] <- sum(agents[[paste0("opinion",k)]][neighbors] *
                   agents[[paste0("strength",k)]][neighbors]) /
               sum(agents[[paste0("strength",k)]][neighbors])
  }
  infl
}

update_opinions <- function(agent_row, influence, rate=0.2, opinions){
  for(k in 1:opinions){
    agent_row[[paste0("opinion",k)]] <- agent_row[[paste0("opinion",k)]] +
      rate*(influence[k]-agent_row[[paste0("opinion",k)]])
    # keep in [-1,1]
    agent_row[[paste0("opinion",k)]] <- max(-1, min(1, agent_row[[paste0("opinion",k)]]))
  }
  agent_row
}

### Simulation

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
