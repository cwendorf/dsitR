# dsitR
## Plotter

#' Color agents based on values
#'
#' Maps numeric values to colors using a color palette.
#'
#' @param values Numeric vector of values to map to colors.
#' @param col_palette Optional character vector of colors. If NULL, a blue-white-red palette of 100 colors is used.
#'
#' @return Character vector of colors corresponding to the input values.
#' @export
color_agents <- function(values, col_palette=NULL) {
  if(is.null(col_palette)) {
    col_palette <- colorRampPalette(c("blue","white","red"))(100)
  }
  col_palette[as.numeric(cut(values, breaks=100))]
}

#' Plot all agents at a single step
#'
#' Visualizes agents on a grid for a single time step, optionally showing their neighborhood connections
#' and coloring agents according to an opinion value.
#'
#' @param frame Data frame of agents at a single step, including `x`, `y`, and opinion columns.
#' @param neighborhood Optional list of neighbors for each agent, as produced by a neighborhood function.
#' @param opinion Character name of the column in `frame` to use for coloring (default "opinion1").
#' @param main Optional main title for the plot. If NULL, uses the step number from `frame$time`.
#' @param edges Logical; whether to draw lines connecting neighbors (default TRUE).
#' @param col_palette Optional color palette passed to `color_agents`.
#'
#' @return NULL; produces a plot.
#' @export
plot_step <- function(frame, neighborhood=NULL, opinion="opinion1", 
                      main=NULL, edges=TRUE, col_palette=NULL) {

  if(is.null(main)) {
    step_val <- unique(frame$time)
    if(length(step_val) > 1) stop("Frame has multiple steps; provide one step or a title.")
    main <- paste("Step", step_val)
  }

  frame$col <- color_agents(frame[[opinion]], col_palette)

  plot(frame$x, frame$y, type="n", xlab="X", ylab="Y", 
       main=main, xlim=c(1, max(frame$x)), ylim=c(1, max(frame$y)))

  if(edges && !is.null(neighborhood)) {
    n_agents <- nrow(frame)
    for(i in 1:n_agents) {
      for(j in neighborhood[[i]]) {
        segments(frame$x[i], frame$y[i], frame$x[j], frame$y[j], col="grey80", lwd=0.5)
      }
    }
  }

  points(frame$x, frame$y, col=frame$col, pch=19, cex=2)
}

#' Plot a single agent and its neighbors
#'
#' Visualizes a single focal agent on a grid along with its neighbors,
#' coloring agents according to an opinion value.
#'
#' @param frame Data frame of agents at a single step, including `x`, `y`, and opinion columns.
#' @param neighborhood List of neighbors for each agent.
#' @param id Optional integer ID of the focal agent.
#' @param coords Optional numeric vector of length 2 specifying the (x, y) coordinates of the focal agent.
#' @param opinion Character name of the column in `frame` to use for coloring (default "opinion1").
#' @param col_palette Optional color palette passed to `color_agents`.
#' @param edges Logical; whether to draw lines connecting the focal agent to its neighbors (default TRUE).
#' @param focal_cex Numeric; size of the focal agent point (default 3).
#'
#' @return NULL; produces a plot.
#' @export
plot_individual <- function(frame, neighborhood, id=NULL, coords=NULL, 
                            opinion="opinion1", col_palette=NULL, edges=TRUE, focal_cex=3) {
  
  if(!is.null(id)) {
    focal <- id
  } else if(!is.null(coords)) {
    focal <- which(frame$x == coords[1] & frame$y == coords[2])
    if(length(focal) == 0) stop("No agent found at given coordinates.")
  } else {
    stop("Provide either id or coords for the focal agent.")
  }

  frame$col <- color_agents(frame[[opinion]], col_palette)

  step_val <- unique(frame$time)
  if(length(step_val) > 1) stop("Frame has multiple steps; provide only one step for individual plotting.")
  main <- paste("Step", step_val)

  plot(frame$x, frame$y, type="n", xlab="X", ylab="Y",
       xlim=c(1, max(frame$x)), ylim=c(1, max(frame$y)), main=main)

  if(edges && !is.null(neighborhood)) {
    for(j in neighborhood[[focal]]) {
      segments(frame$x[focal], frame$y[focal], frame$x[j], frame$y[j], 
               col="grey80", lwd=0.5)
    }
  }

  points(frame$x, frame$y, col=frame$col, pch=19, cex=2)
  
  points(frame$x[focal], frame$y[focal], col=frame$col[focal], pch=19, cex=focal_cex)
}

#' Animate simulation of agents over time
#'
#' Creates an animation of agents moving over time steps, optionally showing neighborhood connections 
#' and coloring agents according to an opinion value.
#'
#' @param sim_result Data frame of simulation results including `x`, `y`, `time`, and opinion columns.
#' @param neighborhood Optional list of neighbors for each agent, as produced by a neighborhood function.
#' @param opinion Character name of the column in `sim_result` to use for coloring (default "opinion1").
#' @param delay Numeric; time delay between steps in seconds (default 0.2).
#' @param edges Logical; whether to draw lines connecting neighbors (default TRUE).
#' @param col_palette Optional color palette to use for mapping opinion values. If NULL, uses a blue-white-red palette of 100 colors.
#'
#' @return NULL; produces an animated plot.
#' @export
animate_simulation <- function(sim_result, neighborhood=NULL, opinion="opinion1", 
                               delay=0.2, edges=TRUE, col_palette=NULL) {
  steps <- sort(unique(sim_result$time))
  
  if (is.null(col_palette)) {
    col_palette <- colorRampPalette(c("blue", "white", "red"))(100)
  }

  frame <- subset(sim_result, time == steps[1])
  rows <- max(frame$y)
  cols <- max(frame$x)

  plot(frame$x, frame$y, type="n", xlim=c(1, cols), ylim=c(1, rows),
       xlab="X", ylab="Y", main="")

  if (edges && !is.null(neighborhood)) {
    for (i in 1:nrow(frame)) {
      for (j in neighborhood[[i]]) {
        segments(frame$x[i], frame$y[i], frame$x[j], frame$y[j], col="grey80", lwd=0.5)
      }
    }
  }

  values <- frame[[opinion]]
  colors <- col_palette[as.numeric(cut(values, breaks=100))]
  points(frame$x, frame$y, col=colors, pch=19, cex=2)

  draw_step_title <- function(text) {
    usr <- par("usr")
    rect(usr[1], usr[4], usr[2], usr[4] + diff(usr[3:4])*0.1,
         col="white", border=NA, xpd=NA)
    mtext(text, side=3, line=1, cex=par("cex.main"), font=2)
  }

  draw_step_title(paste("Step", steps[1]))

  for (t in steps[-1]) {
    frame <- subset(sim_result, time == t)
    values <- frame[[opinion]]
    colors <- col_palette[as.numeric(cut(values, breaks=100))]
    
    points(frame$x, frame$y, col=colors, pch=19, cex=2)
    draw_step_title(paste("Step", t))
    
    Sys.sleep(delay)
  }
}

#' Plot force-directed network of agents
#'
#' Visualizes agents as nodes in a force-directed network, showing edges based on a neighborhood structure.
#' Node colors represent an opinion value.
#'
#' @param frame Data frame of agents at a single step, including opinion columns.
#' @param neighborhood List of neighbors for each agent.
#' @param opinion Character name of the column in `frame` to use for node coloring (default "opinion1").
#' @param edge_col Color of edges (default "grey80").
#' @param node_palette Optional color palette for nodes. If NULL, a blue-white-red palette of 100 colors is used.
#' @param node_size Numeric size of nodes (default 2).
#' @param main Optional main title for the plot.
#' @param iterations Number of iterations for force-directed layout (default 200).
#' @param k Attraction strength between connected nodes (default 0.05).
#' @param repel Repulsion strength between all nodes (default 0.01).
#'
#' @return NULL; produces a plot.
#' @export
plot_network <- function(frame, neighborhood,
                         opinion="opinion1",
                         edge_col="grey80", node_palette=NULL,
                         node_size=2, main=NULL,
                         iterations=200, k=0.05, repel=0.01) {
  
  agents <- nrow(frame)

  if(is.null(node_palette)) {
    node_palette <- colorRampPalette(c("blue","white","red"))(100)
  }
  frame$col <- node_palette[cut(frame[[opinion]], breaks=100)]

  edges <- list()
  for(i in 1:length(neighborhood)){
    for(j in neighborhood[[i]]){
      edges <- append(edges, list(c(i,j)))
    }
  }

  pos <- matrix(runif(agents*2, 0, 1), ncol=2)

  for(step in 1:iterations){
    disp <- matrix(0, nrow=agents, ncol=2)

    for(i in 1:agents){
      for(j in 1:agents){
        if(i != j){
          delta <- pos[i,] - pos[j,]
          dist <- sqrt(sum(delta^2)) + 1e-6
          force <- repel / dist^2
          disp[i,] <- disp[i,] + (delta/dist) * force
        }
      }
    }

    for(e in edges){
      i <- e[1]; j <- e[2]
      delta <- pos[i,] - pos[j,]
      dist <- sqrt(sum(delta^2)) + 1e-6
      force <- k * dist^2
      disp[i,] <- disp[i,] - (delta/dist) * force
      disp[j,] <- disp[j,] + (delta/dist) * force
    }

    disp <- disp / apply(disp, 1, function(x) max(1, sqrt(sum(x^2))))
    pos <- pos + 0.01 * disp
  }

  pos <- (pos - apply(pos,2,min)) / (apply(pos,2,max) - apply(pos,2,min) + 1e-6)

  plot(pos, type="n", xlab="", ylab="", axes=FALSE,
       main=main, xlim=c(0,1), ylim=c(0,1))
  for(e in edges){
    i <- e[1]; j <- e[2]
    segments(pos[i,1], pos[i,2], pos[j,1], pos[j,2], col=edge_col)
  }
  points(pos[,1], pos[,2], col=frame$col, pch=19, cex=node_size)
}

#' Animate force-directed network over time
#'
#' Creates an animation of a force-directed network of agents over multiple time steps,
#' showing node colors based on an opinion value and edges based on a neighborhood structure.
#'
#' @param history Data frame of simulation results including `x`, `y`, `time`, and opinion columns.
#' @param neighborhood List of neighbors for each agent.
#' @param opinion Character name of the column in `history` to use for node coloring (default "opinion1").
#' @param edge_col Color of edges (default "grey80").
#' @param node_size Numeric size of nodes (default 2).
#' @param iterations Number of iterations for the force-directed layout per frame (default 200).
#' @param k Attraction strength between connected nodes (default 0.05).
#' @param repel Repulsion strength between all nodes (default 0.01).
#' @param delay Numeric; time delay between frames in seconds (default 0.2).
#'
#' @return NULL; produces an animated plot.
#' @export
animate_network <- function(history, neighborhood,
                            opinion="opinion1",
                            edge_col="grey80", node_size=2,
                            iterations=200, k=0.05, repel=0.01,
                            delay=0.2) {
  
  times <- sort(unique(history$time))
  
  for(t in times){
    frame <- subset(history, time==t)
    plot_network(frame,
                 neighborhood=neighborhood,
                 opinion=opinion,
                 edge_col=edge_col,
                 node_size=node_size,
                 main=paste("Force-directed network (t=", t, ")", sep=""),
                 iterations=iterations, k=k, repel=repel)
    Sys.sleep(delay)
  }
}
