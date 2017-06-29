library(readr)
library(dplyr)
library(tidytext)
library(SnowballC)
library(ggplot2)
library(psych)

# Read file and scrub punctuation
death_metals <- read_csv("reviews.csv")
death_metals$content <- gsub("[!\\.\\?\\|]", " ", death_metals$content)

# Tokenize reviews and remove stop words
rev_tokens <- death_metals %>% 
  group_by(title, score) %>% 
  unnest_tokens(word, content) %>% 
  anti_join(stop_words)
stemmed_tokens <- rev_tokens %>% ungroup %>% mutate(word = wordStem(word))

# title_tokens <- death_metals %>% 
#   unnest_tokens(tword, title) %>% 
#   anti_join(stop_words)
# stemmed_title_tokens <- title_tokens %>% ungroup %>% mutate(tword = wordStem(tword))

# Get word counts
group_count <- rev_tokens %>% count(word, sort = TRUE)
ungrouped_count <- rev_tokens %>% ungroup %>% count(word, sort = TRUE)
stemmed_count <- stemmed_tokens %>% count(word, sort = TRUE)

# Plots! PLots! Plots, plots plots plots! (Also, Plots!)
no_stem <- ggplot(head(ungrouped_count, 10), aes(x = reorder(word, n), y = n)) + 
  geom_bar(stat = "identity") + 
  coord_flip() + 
  xlab("Word") + 
  ylab("Occurrences")

stem <- ggplot(head(stemmed_count, 10), aes(x = reorder(word, n), y = n)) + 
  geom_bar(stat = "identity") + 
  coord_flip() + 
  xlab("Word") + 
  ylab("Occurrences")

# Sort group counts by title, then join with sentiments
# Repeat this with stemming?
sorted_counts <- group_count %>% arrange(title)
afinn <- get_sentiments("afinn") %>% rename(sentiment = score)
group_sentiments <- sorted_counts %>% 
  inner_join(afinn, by = "word")

# Get aggregated scores per review
# TODO: Get the mean departure from the mean!
aggs <- summarize(group_sentiments,
                  avg_sent = mean(sentiment),
                  med_sent = median(sentiment),
                  tot_sent = sum(sentiment))

# Plot averages (both ways) and get summary statistics
avg_splot <- ggplot(data = aggs, aes(x = avg_sent, y = score)) + geom_point()
med_splot <- ggplot(data = aggs, aes(x = med_sent, y = score)) + geom_point()
tot_splot <- ggplot(data = aggs, aes(x = tot_sent, y = score)) + geom_point()
aa_summary <- aggs %>% 
  ungroup %>% 
  select(score, avg_sent, med_sent, tot_sent) %>% 
  describe
