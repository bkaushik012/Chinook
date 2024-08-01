# Load necessary libraries
library(DBI)
library(RSQLite)
library(dplyr)

# Connect to the SQLite database
con <- dbConnect(RSQLite::SQLite(), "C:/Users/Bhavana/Downloads/Chinook_Sqlite_AutoIncrementPKs.sqlite")


# List all tables
tables <- dbListTables(con)

# Load each table into a list of data frames
data_list <- lapply(tables, function(tbl) {
  dbReadTable(con, tbl)
})

# Assign names to the list elements
names(data_list) <- tables

# Disconnect from the database
dbDisconnect(con)

# Access data frames from the list
Artist <- data_list$Artist
Album <- data_list$Album
Track <- data_list$Track
Genre <- data_list$Genre
Customer <- data_list$Customer
Invoice <- data_list$Invoice
InvoiceLine <- data_list$InvoiceLine
Employee <- data_list$Employee
