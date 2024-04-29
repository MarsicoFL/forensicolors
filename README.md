# forensicolors
An open source software package written in R statistical language. It consist in a set of tools to compute likelihood ratios based on pigmentation traits. Also, it allows computing conditional probabilities for unidentified individuals based on missing person characteristics. A set of tailored plots are incoporated to analyze likelihood ratio distributions.


There execute the following commands to run a pilot analysis:
```r
install.packages("devtools")
library(devtools)
install_github("MarsicoFL/forensicolors")
library(forensicolors)

data <- forensicolors::simRef()
conditioned <- conditionedProp(data, 1, 1, 1, 0.01, 0.01, 0.01) 
unconditioned <- forensicolors::refProp(data)
likelihoods <- compute_LRs(conditioned, unconditioned) 

plotLR(likelihoods)
```

Soon, you will be able to download it from CRAN.
