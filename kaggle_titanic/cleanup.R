# Do some data pre-processing and cleanup
# It is assumed that the training dataset is "train" and the test set is 
# "test". The stringsAsFactors argument should be FALSE.

library(stringr)

# Get some age-related information for filling in missing ages
median.age <- median(train$Age, na.rm = TRUE)
sd.age <- sd(train$Age, na.rm = TRUE)

# Get fare information for the same (no NAs in training set)
median.fare <- median(train$Fare)

# For males, "master" pretty much always means a boy of less than 18. For 
# them, we'll give them the median age minus one standard deviation, 
# guaranteeing a value less than 18 with the given data set.
masters.train <- train[!is.na(str_locate(train$Name, "Master")[,1]),]
masters.train$Age[is.na(masters.train$Age)] <- (median.age - sd.age)

masters.test <- test[!is.na(str_locate(test$Name, "Master")[,1]),]
masters.test$Age[is.na(masters.test$Age)] <- (median.age - sd.age)

# For females, it gets a bit more complicated. "Miss" often refers to a 
# girl under 18. However, it appears to occasionally reference adult women 
# who are presumably unmarried. As a result, we can't count on the title as 
# fool-proof guide to age. On the other hand, girls under 18 are always "Miss" 
# whereas that's not necessarily true for adult women. Here we'll basically 
# use a coin flip to determine whether or not a "Miss" is a girl or a woman 
# and assign an age accordingly.
assign.age <- function() {
  flip <- sample(0:1, 1)
  
  if (flip == 0) {
    median.age
  } else {
    median.age - sd.age
  }
}

misses.train <- train[!is.na(str_locate(train$Name, "Miss")[,1]),]
misses.train$Age[is.na(misses.train$Age)] <- assign.age()

misses.test <- test[!is.na(str_locate(test$Name, "Miss")[,1]),]
misses.test$Age[is.na(misses.test$Age)] <- assign.age()
