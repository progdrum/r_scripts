library(readr)
library(dplyr)
library(tidytext)

death_metals <- read_csv("reviews.csv")

# Tokenize reviews and remove stop words
rev_tokens <- death_metals %>% 
  group_by(title) %>% 
  unnest_tokens(word, content) %>% 
  anti_join(stop_words)

# Get word counts
group_count <- rev_tokens %>% count(word, sort = TRUE)
ungrouped_count <- rev_tokens %>% count(word, sort = TRUE)
