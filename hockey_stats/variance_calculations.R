# Get rolling deviations, variances, and what-have-yous

# Get rolling standard deviation values
get.sd <- function(nums) {
  # Default first value to NA, since there is no deviation for first game
  dev.vector <- c(NA)
  
  for(val in seq(from = 2, to = length(nums))) {
    dev.vector <- c(dev.vector, sd(nums[1:val]))
  }
  
  dev.vector
}
