# Installing and loading packages
install.packages('foreign')
install.packages("haven")
install.packages("readxl")
install.packages("writexl")

library(foreign); library(readxl); library(haven); library(writexl)

# Data import from IBM SPSS Statistics
ds.SPSS <- read.spss(file = "NIAD - Original.sav", to.data.frame = TRUE, use.value.labels = TRUE)

# Data import from CVS
ds.CSV <- read.csv(file = "Baza de date CSV.txt")
ds.CSV <- read.csv(file = "Baza de date CSV 2.txt", sep = ";")
ds.CSV <- read.csv2(file = "Baza de date CSV 2.txt")

# Data import from TAB separated values
ds.TAB <- read.table(file = "Baza de date TAB.txt", sep = "\t", header = TRUE)

# Data import from Microsoft Excel
ds.EXCEL <- read_excel(path = "Baza de date Excel.xls", sheet = 1)

# Data export in CSV format
write.table(x = ds.SPSS, file = "NIAD.csv", sep = ";")
write.csv(x = ds.SPSS, file = "NIAD.csv")
write.csv2(x = ds.SPSS, file = "NIAD.csv")

# Data export in IBM SPSS Format
write_sav(data = ds.SPSS, path = "NIAD.sav")

# Data export in Microsoft Excel format
write_xlsx(x = ds.SPSS, path = "NIAD.xlsx")
