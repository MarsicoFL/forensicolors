# forensicolors
An open source software package written in R statistical language. It consist in a set of tools to compute likelihood ratios based on pigmentation traits. Also, it allows computing conditional probabilities for unidentified individuals based on missing person characteristics. A set of tailored plots are incoporated to analyze likelihood ratio distributions.

Download this folder, unzip, and open forensicolors.Rproj file with Rstudio.
Soon, you will be able to download it from CRAN.

There execute the following commands:
```r
library(devtools)
load_all()
document()
install()


data <- forensicolors::simRef()
conditioned <- conditionedProp(data, 1, 1, 1, 0.01, 0.01, 0.01) 
unconditioned <- forensicolors::refProp(data)
likelihoods <- compute_LRs(conditioned, unconditioned) 

plotLR(likelihoods)
```
