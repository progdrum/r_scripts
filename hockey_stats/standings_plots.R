# Plots of standings summaries (calculated from standings_summaries.R)

library("reshape2")
library("ggplot2")

source("standings_summaries.R")

division.names <- c("Atlantic", "Metropolitan", "Central", "Pacific")
wins <- c(atlantic.avg.W, metropolitan.avg.W, central.avg.W, pacific.avg.W)
losses <- c(atlantic.avg.L, metropolitan.avg.L, central.avg.L, pacific.avg.L)
ols <- c(atlantic.avg.OL, metropolitan.avg.OL, central.avg.OL, pacific.avg.OL)
pts <- c(atlantic.avg.pts, metropolitan.avg.pts, central.avg.pts, pacific.avg.pts)
ptsp <- c(atlantic.avg.ptsp, metropolitan.avg.ptsp, central.avg.ptsp, pacific.avg.ptsp)

wins.med <- c(atlantic.med.W, metropolitan.med.W, central.med.W, pacific.med.W)
losses.med <- c(atlantic.med.L, metropolitan.med.L, central.med.L, pacific.med.L)
ols.med <- c(atlantic.med.OL, metropolitan.med.OL, central.med.OL, pacific.med.OL)
pts.med <- c(atlantic.med.pts, metropolitan.med.pts, central.med.pts, pacific.med.pts)
ptsp.med <- c(atlantic.med.ptsp, metropolitan.med.ptsp, central.med.ptsp, pacific.med.ptsp)

wins.sd <- c(atlantic.sd.W, metropolitan.sd.W, central.sd.W, pacific.sd.W)
losses.sd <- c(atlantic.sd.L, metropolitan.sd.L, central.sd.L, pacific.sd.L)
ols.sd <- c(atlantic.sd.OL, metropolitan.sd.OL, central.sd.OL, pacific.sd.OL)
pts.sd <- c(atlantic.sd.pts, metropolitan.sd.pts, central.sd.pts, pacific.sd.pts)
ptsp.sd <- c(atlantic.sd.ptsp, metropolitan.sd.ptsp, central.sd.ptsp, pacific.sd.ptsp)

wins.var <- c(atlantic.var.W, metropolitan.var.W, central.var.W, pacific.var.W)
losses.var <- c(atlantic.var.L, metropolitan.var.L, central.var.L, pacific.var.L)
ols.var <- c(atlantic.var.OL, metropolitan.var.OL, central.var.OL, pacific.var.OL)
pts.var <- c(atlantic.var.pts, metropolitan.var.pts, central.var.pts, pacific.var.pts)
ptsp.var <- c(atlantic.var.ptsp, metropolitan.var.ptsp, central.var.ptsp, pacific.var.ptsp)

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

win.meds <- cbind.data.frame(division.names, wins.med)
colnames(win.meds) <- c("Divisions", "Wins")

loss.meds <- cbind.data.frame(division.names, losses.med)
colnames(loss.meds) <- c("Divsions", "Losses")

ol.meds <- cbind.data.frame(division.names, ols.med)
colnames(ol.meds) <- c("Divisions", "OT.Losses")

pts.meds <- cbind.data.frame(division.names, pts.med)
colnames(pts.meds) <- c("Divisions", "Points")

ptsp.meds <- cbind.data.frame(division.names, ptsp.med)
colnames(ptsp.meds) <- c("Divisions", "Points.Pct")

stack.meds <- cbind.data.frame(division.names, wins.med, losses.med, ols.med)
colnames(stack.meds) <- c("Divisions", "Wins", "Losses", "OT.Losses")
stack.meds2 <- melt(stack.meds, id.vars = "Divisions")

win.sds <- cbind.data.frame(division.names, wins.sd)
colnames(win.sds) <- c("Divisions", "Wins.SD")

loss.sds <- cbind.data.frame(division.names, losses.sd)
colnames(loss.sds) <- c("Divisions", "Losses.SD")

ol.sds <- cbind.data.frame(division.names, ols.sd)
colnames(ol.sds) <- c("Divisions", "OT.Losses.SD")

pts.sds <- cbind.data.frame(division.names, pts.sd)
colnames(pts.sds) <- c("Divisions", "Points.SD")

ptsp.sds <- cbind.data.frame(division.names, ptsp.sd)
colnames(ptsp.sds) <- c("Divisions", "Points.Pct.SD")

win.vars <- cbind.data.frame(division.names, wins.var)
colnames(win.vars) <- c("Divisions", "Wins.Variance")

loss.vars <- cbind.data.frame(division.names, losses.var)
colnames(loss.vars) <- c("Divisions", "Losses.Variance")

ol.vars <- cbind.data.frame(division.names, ols.var)
colnames(ol.vars) <- c("Divisions", "OT.Losses.Variance")

pts.vars <- cbind.data.frame(division.names, pts.var)
colnames(pts.vars) <- c("Divisions", "Points.Variance")

ptsp.vars <- cbind.data.frame(division.names, ptsp.var)
colnames(ptsp.vars) <- c("Divisions", "Points.Pct.Variance")

# Average plots

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
  ylab("Games Played") + 
  ggtitle("Summary of Wins, Losses, and OT Losses (Average) By Division")

p5 <- ggplot(stack.avgs2, aes(x = Divisions, y = value, fill = variable)) + 
  geom_bar(stat = "identity", position = "fill") + 
  ylab("Normalized Value") + 
  ggtitle("Summary of Wins, Losses, and OT Losses (Average) By Division")

p6 <- ggplot(pts.avgs, aes(x = Divisions, y = Points, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Average Points By Division") + 
  guides(fill = FALSE)

p7 <- ggplot(ptsp.avgs, aes(x = Divisions, y = Points.Pct, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Average Points % By Division") + 
  guides(fill = FALSE)

# Median plots

p8 <- ggplot(win.meds, aes(x = Divisions, y = Wins, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Wins, 2))) + 
  ggtitle("Median Wins By Division") + 
  guides(fill = FALSE)

p9 <- ggplot(loss.meds, aes(x = Divisions, y = Losses, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Losses, 2))) + 
  ggtitle("Median Losses By Division") + 
  guides(fill = FALSE)

p10 <- ggplot(ol.meds, aes(x = Divisions, y = OT.Losses, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(OT.Losses, 2))) + 
  ggtitle("Median OT Losses By Division") + 
  guides(fill = FALSE)

p11 <- ggplot(stack.meds2, aes(x = Divisions, y = value, fill = variable)) + 
  geom_bar(stat = "identity", position = "stack") + 
  ylab("Games Played") + 
  ggtitle("Summary of Wins, Losses, and OT Losses (Median) By Division")

p12 <- ggplot(stack.meds2, aes(x = Divisions, y = value, fill = variable)) + 
  geom_bar(stat = "identity", position = "fill") + 
  ylab("Normalized Value") + 
  ggtitle("Summary of Wins, Losses, and OT Losses (Median) By Division")

p13 <- ggplot(pts.meds, aes(x = Divisions, y = Points, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Median Points By Division") + 
  guides(fill = FALSE)

p14 <- ggplot(ptsp.meds, aes(x = Divisions, y = Points.Pct, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Median Points % By Division") + 
  guides(fill = FALSE)

# Standard Deviation plots

p15 <- ggplot(win.sds, aes(x = Divisions, y = Wins.SD, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Wins.SD, 2))) + 
  ggtitle("Std. Dev. Wins By Division") + 
  guides(fill = FALSE)

p16 <- ggplot(loss.sds, aes(x = Divisions, y = Losses.SD, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Losses.SD, 2))) + 
  ggtitle("Std. Dev. Losses By Division") + 
  guides(fill = FALSE)

p17 <- ggplot(ol.sds, aes(x = Divisions, y = OT.Losses.SD, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(OT.Losses.SD, 2))) + 
  ggtitle("Std. Dev. OT Losses By Division") + 
  guides(fill = FALSE)

p18 <- ggplot(pts.sds, aes(x = Divisions, y = Points.SD, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Std. Dev. Points By Division") + 
  guides(fill = FALSE)

p19 <- ggplot(ptsp.sds, aes(x = Divisions, y = Points.Pct.SD, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Std. Dev. Points % By Division") + 
  guides(fill = FALSE)

# Variance plots

p20 <- ggplot(win.vars, aes(x = Divisions, y = Wins.Variance, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Wins.Variance, 2))) + 
  ggtitle("Variance Of Wins By Division") + 
  guides(fill = FALSE)

p21 <- ggplot(loss.vars, aes(x = Divisions, y = Losses.Variance, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(Losses.Variance, 2))) + 
  ggtitle("Variance Of Losses By Division") + 
  guides(fill = FALSE)

p22 <- ggplot(ol.vars, aes(x = Divisions, y = OT.Losses.Variance, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = round(OT.Losses.Variance, 2))) + 
  ggtitle("Variance Of OT Losses By Division") + 
  guides(fill = FALSE)

p23 <- ggplot(pts.vars, aes(x = Divisions, y = Points.Variance, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Variance Of Points By Division") + 
  guides(fill = FALSE)

p24 <- ggplot(ptsp.vars, aes(x = Divisions, y = Points.Pct.Variance, fill = Divisions)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Variance Of Points % By Division") + 
  guides(fill = FALSE)
