# Installing and loading libraries
if(!require(rstatix)) install.packages("rstatix")
if(!require(psych)) install.packages("psych")
library(rstatix); library(psych)

# Loading dataset
load(file = "NIAD.RData"); names(ds)

# I. Outliers detection ####
identify_outliers(data = ds, variable = "varsta")
boxplot(ds$varsta, horizontal = T, col = "green", outline = T)
identify_outliers(data = ds, variable = "iq")
boxplot(ds$iq, horizontal = T, col = "green", outline = T)
#ds$iq[ds$iq == 125] <- 185
#ds$iq[ds$iq >= 185] <- NA

# II. Missing cases analysis and multiple imputation ####


# III. Univariate statistics and normality ####
#desc.age <- psych::describe(x = ds$varsta); desc.age
#desc.iq <- psych::describe(x = ds$iq); desc.iq
desc <- psych::describe(x = ds$varsta)
desc <- rbind(desc,  psych::describe(x = ds$iq))
rownames(desc) <- c("Age", "IQ"); desc

# IV. Participants' characteristics ####
n <- nrow(ds)

## Gender analysis ####
gen <- table(ds$gen); gen
gen.p <- round(gen / n * 100, 2); gen.p

# V. Multivariate normality assumption ####


# VI. Correlation matrix ####




