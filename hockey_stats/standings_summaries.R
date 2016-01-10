# Calculate summary statistics by division

source("get_standings_data.R")

# Gather divisional data
divisions <- get.standings()

atlantic.avg.W <- mean(divisions$atlantic$W)
atlantic.avg.L <- mean(divisions$atlantic$L)
atlantic.avg.OL <- mean(divisions$atlantic$OL)
atlantic.avg.pts <- mean(divisions$atlantic$PTS)
atlantic.avg.ptsp <- mean(divisions$atlantic$PTS%)
atlantic.avg.sos <- mean(divisions$atlantic$SOS)

metropolitan.avg.W <- mean(divisions$metropolitan$W)
metropolitan.avg.L <- mean(divisions$metropolitan$L)
metropolitan.avg.OL <- mean(divisions$metropolitan$OL)
metropolitan.avg.pts <- mean(divisions$metropolitan$PTS)
metropolitan.avg.ptsp <- mean(divisions$metropolitan$PTS%)
metropolitan.avg.sos <- mean(divisions$metropolitan$SOS)

central.avg.W <- mean(divisions$central$W)
central.avg.L <- mean(divisions$central$L)
central.avg.OL <- mean(divisions$central$OL)
central.avg.pts <- mean(divisions$central$PTS)
central.avg.ptsp <- mean(divisions$central$PTS%)
central.avg.sos <- mean(divisions$central$SOS)

pacific.avg.W <- mean(divisions$pacific$W)
pacific.avg.L <- mean(divisions$pacific$L)
pacific.avg.OL <- mean(divisions$pacific$OL)
pacific.avg.pts <- mean(divisions$pacific$PTS)
pacific.avg.ptsp <- mean(divisions$pacific$PTS%)
pacific.avg.sos <- mean(divisions$pacific$SOS)
