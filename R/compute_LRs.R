#' Compute Likelihood Ratios (LRs) for Matching Personal Characteristics
#'
#' This function calculates the Likelihood Ratios (LRs) for each individual in a dataset
#' based on the comparison of hair color, skin color, and eye color between a Missing Person (MP)
#' and the Unidentified Persons (UPs) in the dataset. It also accounts for error rates
#' in the observation of each characteristic.
#'
#' @param data A data.frame containing the characteristics of the UPs.
#' @param h An integer representing the hair color of the MP.
#' @param s An integer representing the skin color of the MP.
#' @param y An integer representing the eye color of the MP.
#' @param eh A numeric value representing the error rate for observing hair color.
#' @param es A numeric value representing the error rate for observing skin color.
#' @param ey A numeric value representing the error rate for observing eye color.
#' @return A numeric vector containing the LRs for each individual in the dataset, calculated
#' based on the probability of observing the given combination of characteristics in the MP
#' and comparing it with each UP in the dataset.
#' 
#' @examples
#' compute_LRs(data, 1, 1, 1, 0.01, 0.01, 0.01) # Calculate LRs for a given set of MP characteristics and error rates.
#' @export
compute_LRs <- function(data, h, s, y, eh, es, ey) {
    # Initialize an empty vector to store the LRs
    LRs <- numeric(nrow(data))
    
    # Frequency of the specific combination in the dataset
    f_h_s_y <- sum(data$hair_colour == h & data$skin_colour == s & data$eye_colour == y) / nrow(data)
    
    # Loop through each individual in the dataset
    for (i in 1:nrow(data)) {
        # Check for concordance/discordance in each variable
        C_h <- as.integer(data$hair_colour[i] == h)
        C_s <- as.integer(data$skin_colour[i] == s)
        C_y <- as.integer(data$eye_colour[i] == y)
        
        # Compute the numerator based on concordance/discordance
        if (C_h && C_s && C_y) {
            numerator <- 1 - eh - es - ey
        } else if (C_h && C_s) {
            numerator <- (1 - ey) * eh * es
        } else if (C_h && C_y) {
            numerator <- (1 - es) * eh * ey
        } else if (C_s && C_y) {
            numerator <- (1 - eh) * es * ey
        } else if (C_h) {
            numerator <- (1 - es - ey) * eh
        } else if (C_s) {
            numerator <- (1 - eh - ey) * es
        } else if (C_y) {
            numerator <- (1 - eh - es) * ey
        } else {
            numerator <- eh * es * ey
        }
        
        # Compute the LR for this individual
        LRs[i] <- numerator / f_h_s_y
    }
    
    return(LRs)
}

