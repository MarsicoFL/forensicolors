#' Plot Distribution of Likelihood Ratios
#'
#' This function creates a density plot for the distribution of Likelihood Ratios (LRs)
#' calculated for a dataset. 
#'
#' @param LRs A numeric vector containing the Likelihood Ratios computed by the compute_LRs function.
#' @import ggplot2
#' @examples
#' # Assuming 'LRs' is the output from compute_LRs function
#' plotLRs(LRs)
#' @export
plotLRs <- function(LRs) {
  require(ggplot2)
  
  data <- data.frame(LikelihoodRatios = LRs)
  
  p <- ggplot(data, aes(x = LikelihoodRatios)) +
    geom_density(fill = "blue", alpha = 0.5) +
    theme_minimal() +
    labs(title = "Density Plot of Likelihood Ratios",
         x = "Likelihood Ratio",
         y = "Density") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  # Return the plot
  return(p)
}
