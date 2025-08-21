# dsitR
## Statistics

### Helper: compute local neighbors based on grid (radius = 1)

.local <- function(frame, i, radius=1) {
  dx <- abs(frame$x - frame$x[i])
  dy <- abs(frame$y - frame$y[i])
  neighbors <- which(dx <= radius & dy <= radius & !(dx == 0 & dy == 0))
  neighbors
}

### Compute correlation across opinions (global)

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

### Compute local consolidation (average similarity to neighbors)

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

### Compute diversity (global variance)

compute_diversity <- function(frame) {
  opinion_cols <- grep("^opinion\\d+$", names(frame), value = TRUE)
  vals <- apply(frame[, opinion_cols], 2, var)
  setNames(c(vals, mean(vals)), c(opinion_cols, "average"))
}

### Compute spatial clustering (local)

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

### Compute all metrics per frame (per step)

compute_metrics <- function(frame) {
  list(
    correlation   = compute_correlation(frame),
    consolidation = compute_consolidation(frame),
    diversity     = compute_diversity(frame),
    clustering    = compute_clustering(frame)
  )
}

### Compute metrics over all steps in simulation

compute_trends <- function(sim_result) {
  times <- sort(unique(sim_result$time))
  metrics_list <- vector("list", length(times))
  
  for (t in seq_along(times)) {
    frame <- subset(sim_result, time == times[t])
    metrics <- compute_metrics(frame)
    metrics_list[[t]] <- c(time = times[t], unlist(metrics, recursive=TRUE, use.names=TRUE))
  }
  
  metrics_df <- do.call(rbind, metrics_list)
  as.data.frame(metrics_df)
}

### Plot the trend of a metric

plot_trend <- function(metrics_df, metric, opinion="average", col="blue", lwd=2) {
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
  if (!col_name %in% names(metrics_df)) stop(paste0("Column '", col_name, "' not found"))
  metric_vector <- data.frame(time = metrics_df$time, value = metrics_df[[col_name]])
  metric_cap <- paste0(toupper(substring(metric, 1, 1)), substring(metric, 2))
  opinion_formatted <- format_opinion(opinion)
  plot(metric_vector$time, metric_vector$value, type="l",
       xlab="Time", ylab=paste(metric_cap, "Index"),
       main=paste(metric_cap, "for", opinion_formatted),
       col=col, lwd=lwd)
  points(metric_vector$time, metric_vector$value, pch=16, col=col)
}
