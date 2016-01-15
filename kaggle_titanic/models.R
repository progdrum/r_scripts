# This is where we'll do some modeling on the Titanic data

library(caret)

# Random Forest
rf1 <- train(Survived ~ Pclass + Fare + Sex + Child + SibSp + Parch, 
             data = train, method = "rf", importance = TRUE)

rf2 <- train(Survived ~ Sex + Child + Age + Pclass + Fare + SibSp + Parch + Embarked, 
             data = train, method = "rf", importance = TRUE)

rf3 <- train(Survived ~ Sex + Pclass + Fare + Age + Child + SibSp + Parch + Embarked, 
             data = train, method = "rf", importance = TRUE)
