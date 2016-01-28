# Plots of standings summaries (calculated from standings_summaries.R)

library("reshape2")

source("standings_summaries.R")

division.names <- c("Atlantic", "Metropolitan", "Central", "Pacific")
wins <- c(atlantic.avg.W, metropolitan.avg.W, central.avg.W, pacific.avg.W)
losses <- c(atlantic.avg.L, metropolitan.avg.L, central.avg.L, pacific.avg.L)
ols <- c(atlantic.avg.OL, metropolitan.avg.OL, central.avg.OL, pacific.avg.OL)
pts <- c(atlantic.avg.pts, metropolitan.avg.pts, central.avg.pts, pacific.avg.pts)
ptsp <- c(atlantic.avg.ptsp, metropolitan.avg.ptsp, central.avg.ptsp, pacific.avg.ptsp)
win.avgs <- cbind.data.frame(division.names, wins)
colnames(win.avgs) <- c("Divisions", "Wins")

loss.avgs <- cbind.data.frame(division.names, losses)
colnames(loss.avgs) <- c("Divisions", "Losses")

ol.avgs <- cbind.data.frame(division.names, ols)
colnames(ol.avgs) <- c("Divisions", "OT.Losses")

stack.avgs <- cbind.data.frame(division.names, wins, losses, ols)
colnames(stack.avgs) <- c("Divisions", "Wins", "Losses", "OT.Losses")
stack.avgs2 <- melt(stack.avgs, id.vars = "Divisions")

pts.avgs <- cbind.data.frame(division.names, pts)
colnames(pts.avgs) <- c("Divisions", "Points")

ptsp.avgs <- cbind.data.frame(division.names, ptsp)
colnames(ptsp.avgs) <- c("Divisions", "Points.Pct")

p1 <- ggplot(win.avgs, aes(x = Divisions, y = Wins, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Wins, 2))) + 
  ggtitle("Average Wins By Division") + 
  guides(fill = FALSE)

p2 <- ggplot(loss.avgs, aes(x = Divisions, y = Losses, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Losses, 2))) + 
  ggtitle("Average Losses By Division") + 
  guides(fill = FALSE)

p3 <- ggplot(ol.avgs, aes(x = Divisions, y = OT.Losses, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(OT.Losses, 2))) + 
  ggtitle("Average OT Losses By Division") + 
  guides(fill = FALSE)

p4 <- ggplot(stack.avgs2, aes(x = Divisions, y = value, fill = variable)) + 
  geom_bar(stat = "identity", position = "stack") + 
  ylab("Average Games Played") + 
  ggtitle("Summary of Wins, Losses, and OT Losses (Average) By Division") + 
  guides(fill = FALSE)

p5 <- ggplot(stack.avgs2, aes(x = Divisions, y = value, fill = variable)) + 
  geom_bar(stat = "identity", position = "fill") + 
  ylab("Normalized Value") + 
  ggtitle("Summary of Wins, Losses, and OT Losses (Average) By Division") + 
  guides(fill = FALSE)

p6 <- ggplot(pts.avgs, aes(x = Divisions, y = Points, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Average Points By Division") + 
  guides(fill = FALSE)

p7 <- ggplot(ptsp.avgs, aes(x = Divisions, y = Points.Pct, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Average Points % By Division") + 
  guides(fill = FALSE)
