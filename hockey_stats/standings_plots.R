# Plots of standings summaries (calculated from standings_summaries.R)

source("standings_summaries.R")

division.names <- c("atlantic", "metropolitan", "central", "pacific")
wins <- c(atlantic.avg.W, metropolitan.avg.W, central.avg.W, pacific.avg.W)

win.avgs <- cbind.data.frame(division.names, wins)
colnames(win.avgs) <- c("Divisions", "Wins")

p1 <- ggplot(win.avgs, aes(x = Divisions, y = Wins, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Wins, 2))) + 
  ggtitle("Average Wins By Division")
