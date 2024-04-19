#' Plot Conditioned Proportions from conditionedProp Function
#'
#' This function creates plots for each combination of hair color, skin color,
#' and eye color using the conditioned proportions calculated by the conditionedProp function.
#' It generates a bar plot for each combination showing the conditioned proportion values.
#'
#' @param data The original data frame used in conditionedProp containing 'hair_colour', 'skin_colour', and 'eye_colour'.
#' @param numerators The numeric vector of conditioned proportions obtained from conditionedProp.
#' @import ggplot2
#' @examples
#' # Assuming 'results' is the output from conditionedProp function
#' # and 'data' is the original dataset used
#' plotConditionedProps(data, results)
#' @export
plotConditionedProps <- function(data, numerators) {
  require(ggplot2)
  
  data$numerator <- numerators
  
  data$hair_colour <- as.factor(data$hair_colour)
  data$skin_colour <- as.factor(data$skin_colour)
  data$eye_colour <- as.factor(data$eye_colour)
  
  data$combination <- interaction(data$hair_colour, data$skin_colour, data$eye_colour, sep = " | ")
  
  p <- ggplot(data, aes(x = combination, y = numerator, fill = combination)) +
    geom_bar(stat = "identity", position = position_dodge()) +
    theme_minimal() +
    labs(title = "Conditioned Proportions for Each Characteristic Combination",
         x = "Combination of Hair, Skin, and Eye Colour",
         y = "Conditioned Proportion",
         fill = "Combinations") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  return(p)
}
