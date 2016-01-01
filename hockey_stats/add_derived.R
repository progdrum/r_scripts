# Add derived fields to already-cleaned-up hockey data

library("dplyr")

# Function takes a data frame of cleaned-up data and adds a number of 
# fields derived from existing fields.

add.derived <- function(clean.data) {
  # Sort first to go from least recent season and game to most
  clean.data <- arrange(clean.data, Season, GP)
  
  # Add running goals for and goals against totals
  clean.data <- cbind(clean.data, cumsum(clean.data$Tm))
  clean.data <- cbind(clean.data, cumsum(clean.data$Opp))
  
  # Add total games to date for various averages
  clean.data <- cbind(clean.data, as.integer(rownames(clean.data)))
  
  # And give them names
  colnames(clean.data)[15] <- "GF.total"
  colnames(clean.data)[16] <- "GA.total"
  colnames(clean.data)[17] <- "Games.total"
  
  clean.data %>% rowwise() %>%
    mutate(W.dev = sd(W),
           L.dev = sd(L),
           GF.avg = GF.total / Games.total,
           GA.avg = GA.total / Games.total,
           GFGA.ratio = GF.total / GA.total,
           W.pct = W / Games.total,
           WL.ratio = W / L)
}
