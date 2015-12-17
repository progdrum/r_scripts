# Collect size data for each time for exploratory analysis

library("XML")
library("dplyr")

# Bring in "all teams" data
source("all_teams.R")

get.team.data <- function(team) {
  player.data <- NULL
  tables <- readHTMLTable(
    paste("http://www.hockey-reference.com/teams/", team, "/2016.html", sep = ""))
  roster <- tables$roster
  roster$Ht <- as.character(roster$Ht)

  # Convert the heights to inches for easier processing
  ht.inches <- function(height) {
    splits <- strsplit(height, split = "-")
    splits.num <- lapply(splits, as.numeric)
    height.inches <- splits.num[[1]][1] * 12 + splits.num[[1]][2]
  }

  roster$Ht <- as.integer(lapply(roster$Ht, ht.inches))
  roster$Wt <- as.numeric(levels(roster$Wt))[roster$Wt]
  roster$Team <- team
  player.data <- as.data.frame(roster, stringsAsFactors = FALSE)
}

# Gather data and apply appropriate team names
teams.data <- lapply(teams, get.team.data)
names(teams.data) <- teams

# Create a list of all players, regardless of team
all.players <- rbind_all(teams.data)

# Convert salary values to numerics
all.players$Salary <- as.numeric(gsub(",", "", all.players$Salary))
