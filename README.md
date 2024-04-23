# forensicolors
Download this folder, unzip, and open .Rproj file with Rstudio.

There execute the following command:

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

![distribucion](https://github.com/MarsicoFL/forensicolors/assets/55600771/fbbd340e-5a11-4249-a477-d37f47f0b539)
