#' Compute Conditioned Proportions for Likelihood Assessment
#'
#' This function calculates the conditioned proportions 
#' for pigmentation traits for UP, when UP is MP.
#' It considers error rates for observations
#' of hair color, skin color, and eye color.
#'
#' @param data A data.frame containing the characteristics of UPs.
#' @param h An integer representing the MP's hair color.
#' @param s An integer representing the MP's skin color.
#' @param y An integer representing the MP's eye color.
#' @param eh A numeric value representing the error rate for observing hair color.
#' @param es A numeric value representing the error rate for observing skin color.
#' @param ey A numeric value representing the error rate for observing eye color.
#' @return A numeric vector containing the conditioned proportion (numerator) for each individual in the dataset.
#' These values are calculated based on the probability of observing the given combination
#' of characteristics in the MP, compared to each UP.
#'
#' @examples
#' conditionedProp(data, 1, 1, 1, 0.01, 0.01, 0.01) # Calculate numerators for given MP characteristics and error rates.
#' @export
conditionedProp <- function(data, h, s, y, eh, es, ey) {
    numerators <- numeric(nrow(data))
    
    for (i in 1:nrow(data)) {
        C_h <- as.integer(data$hair_colour[i] == h)
        C_s <- as.integer(data$skin_colour[i] == s)
        C_y <- as.integer(data$eye_colour[i] == y)
        
        if (C_h && C_s && C_y) {
            numerators[i] <- 1 - eh - es - ey
        } else if (C_h && C_s) {
            numerators[i] <- (1 - ey) * eh * es
        } else if (C_h && C_y) {
            numerators[i] <- (1 - es) * eh * ey
        } else if (C_s && C_y) {
            numerators[i] <- (1 - eh) * es * ey
        } else if (C_h) {
            numerators[i] <- (1 - es - ey) * eh
        } else if (C_s) {
            numerators[i] <- (1 - eh - ey) * es
        } else if (C_y) {
            numerators[i] <- (1 - eh - es) * ey
        } else {
            numerators[i] <- eh * es * ey
        }
    }
    
    return(numerators)
}

