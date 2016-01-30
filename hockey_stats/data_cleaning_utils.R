# More data cleaning methods

# Remove zero values from win percentage for overall value
remove.zeros <- function(hockey.data) {
  hockey.data <- hockey.data[hockey.data$W.pct != 0,]
}
