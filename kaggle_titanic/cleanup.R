# Load Titanic data and do some data pre-processing and cleanup

library(stringr)

# Read in the data
train <- read.csv("train.csv", stringsAsFactors = FALSE)
test <- read.csv("test.csv", stringsAsFactors = FALSE)

# Get some age-related information for filling in missing ages
median.age <- median(train$Age, na.rm = TRUE)
sd.age <- sd(train$Age, na.rm = TRUE)

# Get fare information for the same (no NAs in training set)
median.fare <- median(train$Fare)

# For males, "master" pretty much always means a boy of less than 18. For 
# them, we'll give them the median age minus one standard deviation, 
# guaranteeing a value less than 18 with the given data set.
ageless.masters <- !is.na(str_locate(train$Name, "Master")[,1])
empty.ages <- is.na(train[ageless.masters,]$Age)
train[ageless.masters,]$Age[empty.ages] <- (median.age - sd.age)

ageless.masters.test <- !is.na(str_locate(test$Name, "Master")[,1])
empty.ages.test <- is.na(test[ageless.masters.test,]$Age)
test[ageless.masters.test,]$Age[empty.ages.test] <- (median.age - sd.age)

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

timeless.ladies <- !is.na(str_locate(train$Name, "Miss")[,1])
empty.ages <- is.na(train[timeless.ladies,]$Age)
train[timeless.ladies,]$Age[empty.ages] <- assign.age()

timeless.ladies.test <- !is.na(str_locate(test$Name, "Miss")[,1])
empty.ages.test <- is.na(test[timeless.ladies.test,]$Age)
test[timeless.ladies.test,]$Age[empty.ages.test] <- assign.age()

# Let's not forget the adult gents, the remaining ladies, and their ages
train[is.na(train$Age),]$Age <- median.age
test[is.na(test$Age),]$Age <- median.age

# Now we fill in the missing fare in the test set
test$Fare[is.na(test$Fare)] <- median.fare

# Finally, let's add a column indicating whether or not one is a child
train$Child <- train$Age < 18
test$Child <- test$Age < 18

# We do, however, want to be sure that "Survived" is a factor
train$Survived <- as.factor(train$Survived)
