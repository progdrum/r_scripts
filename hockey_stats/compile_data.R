# Load previously downloaded historical season data and clean it up.
# Return as a vector of data frames. Include up-to-date current season data.

library("dplyr")
library("XML")

# Function to retrieve current season data
get.current <- function(team, current.season) {
  tables <- readHTMLTable(paste("http://hockey-reference.com/teams/", 
                                team, "/", current.season, "_games.html", 
                                sep = ""))
  current.year <- tables$games[-c(21, 42, 63, 84), -c(14, 15)]
  
  # Update some column names for clarity
  colnames(current.year)[4] <- "Loc"
  colnames(current.year)[6] <- "Result"
  colnames(current.year)[7] <- "Extra"
  
  current.year
}

# Compile records from past seasons
compile.data <- function(files) {
  agg.data <- lapply(files, function(file) read.csv(file))
  past.games <- rbind_all(agg.data)
  
  # Update some column names for clarity
  colnames(past.games)[4] <- "Loc"
  colnames(past.games)[6] <- "Result"
  colnames(past.games)[7] <- "Extra"
  
  past.games
}
