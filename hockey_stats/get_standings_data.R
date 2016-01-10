# Load current standings information

library("dplyr")
library("XML")

# Retrieve and format standings data
get.standings <- function() {
  tables <- readHTMLTable("http://www.hockey-reference.com/leagues/NHL_2016.html", 
                          stringsAsFactors = FALSE)
  
  # Extract conference-specific info
  east <- tables$EAS_standings
  west <- tables$WES_standings
  
  # Break down by division
  atlantic <- east[2:9,]
  metropolitan <- east[11:18,]
  central <- west[2:8,]
  pacific <- west[10:16,]
  
  # Convert values to numerics (minus team names)
  atlantic[,-1] <- apply(atlantic[,-1], 2, as.numeric)
  metropolitan[,-1] <- apply(metropolitan[,-1], 2, as.numeric)
  central[,-1] <- apply(central[,-1], 2, as.numeric)
  pacific[,-1] <- apply(pacific[,-1], 2, as.numeric)
  
  list(atlantic = atlantic, metropolitan = metropolitan, 
       central = central, pacific = pacific)
}
