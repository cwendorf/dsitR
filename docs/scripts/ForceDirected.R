plot_force_network <- function(frame, neighborhood, opinion="opinion1",
                               edge_col="grey80", node_palette=NULL,
                               node_size=2, main_title=NULL,
                               iterations=200, k=0.05, repel=0.01,
                               rows=NULL, cols=NULL, params=list()) {
  agents <- nrow(frame)
  
  # Colors by opinion
  if(is.null(node_palette)) {
    node_palette <- colorRampPalette(c("blue","white","red"))(100)
  }
  frame$col <- node_palette[cut(frame[[opinion]], breaks=100)]
  
  # Build edge list
  edges <- list()
  for(i in 1:agents){
    neighbors <- neighborhood(i, frame, rows, cols, params)
    for(j in neighbors){
      edges <- append(edges, list(c(i,j)))
    }
  }
  
  # Random initial positions
  pos <- matrix(runif(agents*2, 0, 1), ncol=2)
  
  # Force-directed layout
  for(step in 1:iterations){
    disp <- matrix(0, nrow=agents, ncol=2)
    # Repulsion
    for(i in 1:agents){
      for(j in 1:agents){
        if(i!=j){
          delta <- pos[i,] - pos[j,]
          dist <- sqrt(sum(delta^2)) + 1e-6
          force <- repel / dist^2
          disp[i,] <- disp[i,] + (delta/dist) * force
        }
      }
    }
    # Attraction
    for(e in edges){
      i <- e[1]; j <- e[2]
      delta <- pos[i,] - pos[j,]
      dist <- sqrt(sum(delta^2)) + 1e-6
      force <- k * dist^2
      disp[i,] <- disp[i,] - (delta/dist) * force
      disp[j,] <- disp[j,] + (delta/dist) * force
    }
    # Limit step size (keeps finite)
    disp <- disp / apply(disp, 1, function(x) max(1, sqrt(sum(x^2))))
    pos <- pos + 0.01 * disp
  }
  
  # Normalize positions to [0,1]
  pos <- (pos - apply(pos,2,min)) / (apply(pos,2,max) - apply(pos,2,min) + 1e-6)
  
  # Plot
  plot(pos, type="n", xlab="", ylab="", axes=FALSE,
       main=main_title, xlim=c(0,1), ylim=c(0,1))
  for(e in edges){
    i <- e[1]; j <- e[2]
    segments(pos[i,1], pos[i,2], pos[j,1], pos[j,2], col=edge_col)
  }
  points(pos[,1], pos[,2], col=frame$col, pch=19, cex=node_size)
}


frame20 <- subset(result, time==20)

plot_force_network(frame20,
                   neighborhood=neighbor_moore_outside,
                   opinion="opinion1",
                   rows=rows, cols=cols,
                   main_title="Force-directed network (t=20)")



animate_force_network <- function(history, neighborhood,
                                  opinion="opinion1",
                                  rows=NULL, cols=NULL,
                                  edge_col="grey80", node_size=2,
                                  iterations=200, k=0.05, repel=0.01,
                                  pause=0.2, params=list()) {
  
  times <- sort(unique(history$time))
  
  for(t in times){
    frame <- subset(history, time==t)
    plot_force_network(frame,
                       neighborhood=neighborhood,
                       opinion=opinion,
                       edge_col=edge_col,
                       node_size=node_size,
                       main_title=paste("Force-directed network (t=", t, ")", sep=""),
                       rows=rows, cols=cols,
                       iterations=iterations, k=k, repel=repel,
                       params=params)
    Sys.sleep(pause)  # pause between frames
  }
}

animate_force_network(result,
                      neighborhood=neighbor_moore_outside,
                      opinion="opinion1",
                      rows=rows, cols=cols,
                      pause=0.3)
