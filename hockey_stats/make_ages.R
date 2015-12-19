# Construct a table with summary statistics of ages by team

make.ages <- function() {
  mean.ages <- tapply(all.players$Age, all.players$Team, mean)
  median.ages <- tapply(all.players$Age, all.players$Team, median)
  sd.ages <- tapply(all.players$Age, all.players$Team, sd)
  age.table <- as.data.frame(cbind(mean.ages, median.ages, sd.ages))
  names(age.table) <- c("Mean", "Median", "Std. Dev.")
}
