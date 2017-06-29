library(psych)
library(reshape2)
library(ggplot2)

yp_data <- read.csv("responses.csv")
yp_music <- yp_data[,1:19]

# Describe the data...
describe(yp_music)

# ...and generate a faceted chart of it all.
yp_music_r <- melt(yp_music)

ggplot(yp_music_r, aes(x = value)) + 
  geom_histogram() + 
  facet_wrap(~ variable) + 
  xlab("rating")

# Get genres only
genre_only <- yp_music[,3:19]

# Get a correlation
cor(genre_only, use = "complete.obs")

# Transform the data for another correlation
transform_data <- function(x) {
  if (x < 3) {
    x <- -1
  } else if (x > 3) { 
    x <- 1
  } else { 
    x <- 0
  }
}

t_data <- mapply(transform_data, genre_only[complete.cases(genre_only),])
cor(t_data, use = "complete.obs")
