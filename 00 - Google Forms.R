# Installing and loading packages
install.packages("googledrive")
install.packages("googlesheets4")
library(googledrive); library(googlesheets4)

# Authentication to Google Drive and Google Sheets
drive_auth()
gs4_auth(token = drive_token()); gs4_user()

# Listing spreadsheets
drive_find(type = "spreadsheet")
fil <- drive_get("DT 4")
id.fil <- as_sheets_id(fil); id.fil

# Reading data drom file
ds <- read_sheet(ss = id.fil)
