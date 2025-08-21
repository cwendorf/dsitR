# dsitR
## Statistics

#' Identify local neighbors on a grid
#'
#' Finds neighboring agents within a specified Manhattan radius around a focal agent.
#'
#' @param frame Data frame of agents with `x` and `y` positions.
#' @param i Integer index of the focal agent.
#' @param radius Numeric radius for local neighborhood (default 1).
#'
#' @return Integer vector of neighbor agent IDs within the radius.
#' @keywords internal
.local <- function(frame, i, radius=1) {
  dx <- abs(frame$x - frame$x[i])
  dy <- abs(frame$y - frame$y[i])
  neighbors <- which(dx <= radius & dy <= radius & !(dx == 0 & dy == 0))
  neighbors
}

#' Compute correlations across opinions
#'
#' Calculates Spearman correlations between all pairs of opinion columns in a data frame.
#'
#' @param frame Data frame containing opinion columns named "opinion1", "opinion2", etc.
#'
#' @return Named numeric vector of pairwise correlations, with an additional element `average` giving the mean correlation.
#' @export
compute_correlation <- function(frame) {
  opinion_cols <- grep("^opinion\\d+$", names(frame), value = TRUE)
  n_opinions <- length(opinion_cols)
  if (n_opinions < 2) return(NA)
  cor_mat <- cor(frame[, opinion_cols], method = "spearman")
  cor_vector <- cor_mat[lower.tri(cor_mat)]
  pair_names <- combn(n_opinions, 2, function(x) paste0("opinion", x[1], "_opinion", x[2]))
  names(cor_vector) <- pair_names
  c(cor_vector, average = mean(cor_vector, na.rm = TRUE))
}

#' Compute local opinion consolidation
#'
#' Measures how similar each agent's opinions are to its local neighbors, 
#' using a radius-1 neighborhood on the grid. Returns per-opinion and average consolidation.
#'
#' @param frame Data frame of agents with `x`, `y`, and opinion columns named "opinion1", "opinion2", etc.
#'
#' @return Named numeric vector of consolidation values for each opinion and the overall average.
#' @export
compute_consolidation <- function(frame) {
  opinion_cols <- grep("^opinion\\d+$", names(frame), value = TRUE)
  n_agents <- nrow(frame)
  sim_vals <- matrix(NA, nrow=n_agents, ncol=length(opinion_cols))
  
  for (i in 1:n_agents) {
    nbrs <- .local(frame, i)
    if (length(nbrs) > 0) {
      for (j in seq_along(opinion_cols)) {
        sim_vals[i,j] <- 1 - mean(abs(frame[nbrs, opinion_cols[j]] - frame[i, opinion_cols[j]]))
      }
    }
  }
  
  vals <- colMeans(sim_vals, na.rm=TRUE)
  setNames(c(vals, mean(vals)), c(opinion_cols, "average"))
}

#' Compute opinion diversity
#'
#' Calculates the variance of each opinion across all agents, with an additional average variance.
#'
#' @param frame Data frame containing opinion columns named "opinion1", "opinion2", etc.
#'
#' @return Named numeric vector of per-opinion variance and overall average variance.
#' @export
compute_diversity <- function(frame) {
  opinion_cols <- grep("^opinion\\d+$", names(frame), value = TRUE)
  vals <- apply(frame[, opinion_cols], 2, var)
  setNames(c(vals, mean(vals)), c(opinion_cols, "average"))
}

#' Compute spatial clustering of opinions
#'
#' Measures local similarity of agent opinions with their immediate neighbors on the grid
#' (radius = 1), returning per-opinion clustering values and an overall average.
#'
#' @param frame Data frame of agents with `x`, `y`, and opinion columns named "opinion1", "opinion2", etc.
#'
#' @return Named numeric vector of clustering values for each opinion and the overall average.
#' @export
compute_clustering <- function(frame) {
  opinion_cols <- grep("^opinion\\d+$", names(frame), value = TRUE)
  n_agents <- nrow(frame)
  cluster_vals <- matrix(NA, nrow=n_agents, ncol=length(opinion_cols))
  
  for (i in 1:n_agents) {
    nbrs <- .local(frame, i)
    if (length(nbrs) > 0) {
      for (j in seq_along(opinion_cols)) {
        cluster_vals[i,j] <- 1 - mean(abs(frame[nbrs, opinion_cols[j]] - frame[i, opinion_cols[j]]))
      }
    }
  }
  
  vals <- colMeans(cluster_vals, na.rm=TRUE)
  setNames(c(vals, mean(vals)), c(opinion_cols, "average"))
}

#' Compute all opinion metrics for a step
#'
#' Calculates multiple opinion metrics for a single time step, including 
#' global correlations, local consolidation, global diversity, and spatial clustering.
#'
#' @param frame Data frame of agents at a single time step, with opinion columns named "opinion1", "opinion2", etc.
#'
#' @return A named list containing:
#' \itemize{
#'   \item \code{correlation} - Spearman correlations between opinion pairs.
#'   \item \code{consolidation} - Local similarity with neighbors.
#'   \item \code{diversity} - Global opinion variance.
#'   \item \code{clustering} - Spatial clustering of opinions.
#' }
#' @export
compute_metrics <- function(frame) {
  list(
    correlation   = compute_correlation(frame),
    consolidation = compute_consolidation(frame),
    diversity     = compute_diversity(frame),
    clustering    = compute_clustering(frame)
  )
}

#' Compute opinion metrics over all simulation steps
#'
#' Calculates multiple opinion metrics—correlation, consolidation, diversity, and clustering—
#' for each time step in a simulation.
#'
#' @param simulation Data frame of simulation results including `time` and opinion columns.
#'
#' @return Data frame where each row corresponds to a time step, containing all computed metrics.
#' @export
compute_trends <- function(simulation) {
  times <- sort(unique(simulation$time))
  metrics_list <- vector("list", length(times))
  
  for (t in seq_along(times)) {
    frame <- subset(simulation, time == times[t])
    metrics <- compute_metrics(frame)
    metrics_list[[t]] <- c(time = times[t], unlist(metrics, recursive=TRUE, use.names=TRUE))
  }
  
  trends <- do.call(rbind, metrics_list)
  as.data.frame(trends)
}

#' Plot the trend of a specific metric over time
#'
#' Visualizes the temporal evolution of a chosen opinion metric from the simulation trends.
#'
#' @param trends Data frame produced by `compute_trends()`, containing time and metric columns.
#' @param metric Character name of the metric to plot (e.g., "correlation", "consolidation", "diversity", "clustering").
#' @param opinion Character specifying which opinion to plot (default "average"). Can be "average", "opinion1", "opinion2", or pairwise (e.g., "opinion1_opinion2" for correlations).
#' @param col Color of the line and points (default "blue").
#' @param lwd Numeric line width (default 2).
#'
#' @return NULL; produces a plot.
#' @export
plot_trend <- function(trends, metric, opinion="average", col="blue", lwd=2) {
  format_opinion <- function(op) {
    if (op == "average") return("Average")
    if (grepl("^opinion\\d+$", op)) {
      num <- sub("opinion", "", op)
      return(paste("Opinion", num))
    }
    if (grepl("^opinion\\d+_opinion\\d+$", op)) {
      parts <- unlist(strsplit(op, "_"))
      return(paste("Opinion", gsub("opinion","",parts[1]), "& Opinion", gsub("opinion","",parts[2])))
    }
    op
  }
  col_name <- paste0(metric, ".", opinion)
  if (!col_name %in% names(trends)) stop(paste0("Column '", col_name, "' not found"))
  metric_vector <- data.frame(time = trends$time, value = trends[[col_name]])
  metric_cap <- paste0(toupper(substring(metric, 1, 1)), substring(metric, 2))
  opinion_formatted <- format_opinion(opinion)
  plot(metric_vector$time, metric_vector$value, type="l",
       xlab="Time", ylab=paste(metric_cap, "Index"),
       main=paste(metric_cap, "for", opinion_formatted),
       col=col, lwd=lwd)
  points(metric_vector$time, metric_vector$value, pch=16, col=col)
}
