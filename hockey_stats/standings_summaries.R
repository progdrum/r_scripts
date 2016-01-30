# Calculate summary statistics by division

source("get_standings_data.R")

# Gather divisional data
divisions <- get.standings()

# Convert PTSP heading to something R won't choke on
colnames(divisions$atlantic)[7] <- "PTSP"
colnames(divisions$metropolitan)[7] <- "PTSP"
colnames(divisions$central)[7] <- "PTSP"
colnames(divisions$pacific)[7] <- "PTSP"

# Means
atlantic.avg.W <- mean(divisions$atlantic$W)
atlantic.avg.L <- mean(divisions$atlantic$L)
atlantic.avg.OL <- mean(divisions$atlantic$OL)
atlantic.avg.pts <- mean(divisions$atlantic$PTS)
atlantic.avg.ptsp <- mean(divisions$atlantic$PTSP)
atlantic.avg.sos <- mean(divisions$atlantic$SOS)

metropolitan.avg.W <- mean(divisions$metropolitan$W)
metropolitan.avg.L <- mean(divisions$metropolitan$L)
metropolitan.avg.OL <- mean(divisions$metropolitan$OL)
metropolitan.avg.pts <- mean(divisions$metropolitan$PTS)
metropolitan.avg.ptsp <- mean(divisions$metropolitan$PTSP)
metropolitan.avg.sos <- mean(divisions$metropolitan$SOS)

central.avg.W <- mean(divisions$central$W)
central.avg.L <- mean(divisions$central$L)
central.avg.OL <- mean(divisions$central$OL)
central.avg.pts <- mean(divisions$central$PTS)
central.avg.ptsp <- mean(divisions$central$PTSP)
central.avg.sos <- mean(divisions$central$SOS)

pacific.avg.W <- mean(divisions$pacific$W)
pacific.avg.L <- mean(divisions$pacific$L)
pacific.avg.OL <- mean(divisions$pacific$OL)
pacific.avg.pts <- mean(divisions$pacific$PTS)
pacific.avg.ptsp <- mean(divisions$pacific$PTSP)
pacific.avg.sos <- mean(divisions$pacific$SOS)

# Medians
atlantic.med.W <- median(divisions$atlantic$W)
atlantic.med.L <- median(divisions$atlantic$L)
atlantic.med.OL <- median(divisions$atlantic$OL)
atlantic.med.pts <- median(divisions$atlantic$PTS)
atlantic.med.ptsp <- median(divisions$atlantic$PTSP)
atlantic.med.sos <- median(divisions$atlantic$SOS)

metropolitan.med.W <- median(divisions$metropolitan$W)
metropolitan.med.L <- median(divisions$metropolitan$L)
metropolitan.med.OL <- median(divisions$metropolitan$OL)
metropolitan.med.pts <- median(divisions$metropolitan$PTS)
metropolitan.med.ptsp <- median(divisions$metropolitan$PTSP)
metropolitan.med.sos <- median(divisions$metropolitan$SOS)

central.med.W <- median(divisions$central$W)
central.med.L <- median(divisions$central$L)
central.med.OL <- median(divisions$central$OL)
central.med.pts <- median(divisions$central$PTS)
central.med.ptsp <- median(divisions$central$PTSP)
central.med.sos <- median(divisions$central$SOS)

pacific.med.W <- median(divisions$pacific$W)
pacific.med.L <- median(divisions$pacific$L)
pacific.med.OL <- median(divisions$pacific$OL)
pacific.med.pts <- median(divisions$pacific$PTS)
pacific.med.ptsp <- median(divisions$pacific$PTSP)
pacific.med.sos <- median(divisions$pacific$SOS)

# Variance
atlantic.var.W <- var(divisions$atlantic$W)
atlantic.var.L <- var(divisions$atlantic$L)
atlantic.var.OL <- var(divisions$atlantic$OL)
atlantic.var.pts <- var(divisions$atlantic$PTS)
atlantic.var.ptsp <- var(divisions$atlantic$PTSP)
atlantic.var.sos <- var(divisions$atlantic$SOS)

metropolitan.var.W <- var(divisions$metropolitan$W)
metropolitan.var.L <- var(divisions$metropolitan$L)
metropolitan.var.OL <- var(divisions$metropolitan$OL)
metropolitan.var.pts <- var(divisions$metropolitan$PTS)
metropolitan.var.ptsp <- var(divisions$metropolitan$PTSP)
metropolitan.var.sos <- var(divisions$metropolitan$SOS)

central.var.W <- var(divisions$central$W)
central.var.L <- var(divisions$central$L)
central.var.OL <- var(divisions$central$OL)
central.var.pts <- var(divisions$central$PTS)
central.var.ptsp <- var(divisions$central$PTSP)
central.var.sos <- var(divisions$central$SOS)

pacific.var.W <- var(divisions$pacific$W)
pacific.var.L <- var(divisions$pacific$L)
pacific.var.OL <- var(divisions$pacific$OL)
pacific.var.pts <- var(divisions$pacific$PTS)
pacific.var.ptsp <- var(divisions$pacific$PTSP)
pacific.var.sos <- var(divisions$pacific$SOS)

# Standard Deviation
atlantic.sd.W <- sd(divisions$atlantic$W)
atlantic.sd.L <- sd(divisions$atlantic$L)
atlantic.sd.OL <- sd(divisions$atlantic$OL)
atlantic.sd.pts <- sd(divisions$atlantic$PTS)
atlantic.sd.ptsp <- sd(divisions$atlantic$PTSP)
atlantic.sd.sos <- sd(divisions$atlantic$SOS)

metropolitan.sd.W <- sd(divisions$metropolitan$W)
metropolitan.sd.L <- sd(divisions$metropolitan$L)
metropolitan.sd.OL <- sd(divisions$metropolitan$OL)
metropolitan.sd.pts <- sd(divisions$metropolitan$PTS)
metropolitan.sd.ptsp <- sd(divisions$metropolitan$PTSP)
metropolitan.sd.sos <- sd(divisions$metropolitan$SOS)

central.sd.W <- sd(divisions$central$W)
central.sd.L <- sd(divisions$central$L)
central.sd.OL <- sd(divisions$central$OL)
central.sd.pts <- sd(divisions$central$PTS)
central.sd.ptsp <- sd(divisions$central$PTSP)
central.sd.sos <- sd(divisions$central$SOS)

pacific.sd.W <- sd(divisions$pacific$W)
pacific.sd.L <- sd(divisions$pacific$L)
pacific.sd.OL <- sd(divisions$pacific$OL)
pacific.sd.pts <- sd(divisions$pacific$PTS)
pacific.sd.ptsp <- sd(divisions$pacific$PTSP)
pacific.sd.sos <- sd(divisions$pacific$SOS)
