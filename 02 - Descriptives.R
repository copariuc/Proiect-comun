# Installing and loading libraries
if(!require(rstatix)) install.packages("rstatix")
if(!require(psych)) install.packages("psych")
if(!require(sasLM)) install.packages("sasLM")
if(!require(Hmisc)) install.packages("Hmisc")
if(!require(PerformanceAnalytics)) install.packages("PerformanceAnalytics")
library(rstatix); library(psych); library(sasLM); library(Hmisc)
library(PerformanceAnalytics)

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
SkewnessSE(ds$varsta); KurtosisSE(ds$varsta)
## Stabilim intervalul de incredere (+/- 2ES)
2 * SkewnessSE(ds$varsta); 2 * KurtosisSE(ds$varsta)
# CI 95% Skweness: -0.6548913 .....0..... +0.6548913
# CI 95% Kurtosis: -1.288839 ......0..... +1.288839
## Verificam daca Skewness (Kurtosis) intra sau nu in intervalul de incredere
## Varsta S=0.15, Kurtosis=-1.16

## Skewness iese din interval la dreapta - Asimetrica pozitiv (scoruri accentuate mari)
## Skewness iese din interval la stanga - Asimetrica negativ (scoruri accentuate mici)
## Skewness intra in interval - Simetrica

## Kurtosis iese din interval la dreapta - Leptocurtica (ascutita, variabilitate mica)
## Kurtosis iese din interval la stanga - Platicurtica (turtita, variabilitate mare)
## Kurtosis intra in interval - Mezocurtica

# 2 * SkewnessSE(ds$iq); 2 * KurtosisSE(ds$iq)

# Teste de normalitate
shapiro.test(ds$varsta) # Asumptia normalitatii univariate NU ESTE indeplinita
shapiro.test(ds$iq)     # Asumptia normalitatii univariate ESTE indeplinita

# IV. Participants' characteristics ####
n <- nrow(ds)

## Gender analysis ####
gen <- table(ds$gen); gen
gen.p <- round(gen / n * 100, 2); gen.p

# V. Multivariate normality assumption ####


# VI. Correlation matrix ####
ds.cor <- as.matrix(ds[, c("varsta", "iq")]); head(ds.cor)
rcorr(ds.cor, type = "spearman")
chart.Correlation(R = ds.cor, histogram = T, method = "spearman")

