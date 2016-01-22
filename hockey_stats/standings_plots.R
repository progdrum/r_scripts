# Plots of standings summaries (calculated from standings_summaries.R)

source("standings_summaries.R")

win.avgs <- data.frame(atlantic = atlantic.avg.W,
                       metropolitan = metropolitan.avg.W,
                       central = central.avg.W,
                       pacific = pacific.avg.W)

ggplot(data = win.avgs) + geom_bar(x = win.avgs)
