# Let's build some models to identify digits!

set.seed(999)

# Set up training controls
control <- trainControl(method = "cv", number = 10)

# SLAVE
sl1 <- train(label ~ ., data = train, 
             method = "SLAVE", max.iter = 10, 
             max.gen = 10, trControl = control)
