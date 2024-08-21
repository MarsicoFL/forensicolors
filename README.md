<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/forensicolors)](https://CRAN.R-project.org/package=forensicolors)
[![](https://cranlogs.r-pkg.org/badges/grand-total/forensicolors?color=blue)](https://cran.r-project.org/package=forensicolors)

<!-- badges: end -->


# forensicolors
An open source software package written in R statistical language. It consist in a set of tools to compute likelihood ratios based on pigmentation traits. Also, it allows computing conditional probabilities for unidentified individuals based on missing person characteristics. A set of tailored plots are incoporated to analyze likelihood ratio distributions.


There execute the following commands to run a pilot analysis:
```r
install.packages("forensicolors")
library(forensicolors)

data <- forensicolors::simRef()
conditioned <- conditionedProp(data, 1, 1, 1, 0.01, 0.01, 0.01) 
unconditioned <- forensicolors::refProp(data)
likelihoods <- compute_LRs(conditioned, unconditioned) 

plotLR(likelihoods)
```
