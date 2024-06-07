# Installing and loadin libraries
if(!require(foreign)) install.packages("foreign")
library(foreign)

# Importing dataset
ds <- read.spss(file = "NIAD - Original.sav", to.data.frame = T, use.value.labels = T); names(ds)

# Saving dataset in R format
save(ds, file = "NIAD.RData")
