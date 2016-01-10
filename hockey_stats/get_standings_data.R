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
  
  list(atlantic = atlantic, metropolitan = metropolitan, 
       central = central, pacific = pacific)
}
