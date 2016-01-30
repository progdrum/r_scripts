# Load previously downloaded historical season data and clean it up.
# Return as a vector of data frames. Include up-to-date current season data.

library("dplyr")
library("XML")

# Function to retrieve current season data
get.current <- function(team, current.season) {
  tables <- readHTMLTable(paste("http://hockey-reference.com/teams/", 
                                team, "/", current.season, "_games.html", 
                                sep = ""))
  
  # Cut out some irrelevant rows/columns
  current.year <- tables$games[-c(21, 42, 63, 84), -c(14, 15)]
  
  # Add ending year for season
  current.year <- cbind(current.year, as.integer(current.season))
  
  # Get fields into the types that we want
  current.year %>%
    mutate(GP = as.integer(GP),
           Date = as.Date(Date),
           Time = as.character(Time),
           Opponent = as.character(Opponent),
           Tm = as.integer(Tm),
           Opp = as.integer(Opp),
           W = as.integer(W),
           L = as.integer(L),
           OL = as.integer(OL)) -> current.year
  
  # Remove games yet-to-be-played
  current.year <- current.year[complete.cases(current.year),]
  
  # Update some column names for clarity
  colnames(current.year)[4] <- "Loc"
  colnames(current.year)[6] <- "Result"
  colnames(current.year)[7] <- "Extra"
  colnames(current.year)[15] <- "Season"
  
  current.year
}

# Compile records from past seasons
compile.data <- function(files) {
  agg.data <- lapply(files, function(file) read.csv(file))
  past.games <- rbind_all(agg.data)
  
  # Field type transformation
  past.games %>%
    mutate(Date = as.Date(Date)) -> past.games
  
  # Update some column names for clarity
  colnames(past.games)[4] <- "Loc"
  colnames(past.games)[6] <- "Result"
  colnames(past.games)[7] <- "Extra"
  
  past.games
}

# Combine the above functions for an overall view
compile.all <- function(team, current.season, files) {
  past <- compile.data(files)
  current <- get.current(team, current.season)
  
  all.games <- rbind_all(list(current, past))
  
  # Order the games by date
  all.games[order(all.games$Date),]
}
