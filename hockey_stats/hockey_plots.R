# This is a collection of all the exploratory plots for the hockey data
library("ggplot2")

# Plotting player weights (X) vs. heights (Y) for all players in the league
weight.height.dot <- ggplot(data = all.players) + 
  geom_point(aes(x = all.players$Wt, xtext = "test", y = all.players$Ht, 
                 text = paste(all.players$Player, " (", 
                              all.players$Team, ")", sep = ""))) + 
  xlab("Weight (Pounds)") + ylab("Height (Inches)") + 
  ggtitle("Weight vs. Height for Active NHL Players")
