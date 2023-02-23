
## Environment
library(randomForest)
library(dplyr)
data = presidents
attach(data)

## Look at data
glimpse(data)


# Build a random forest model
presidents = randomForest(as.factor(president) ~ number, data = data, ntree=50)

## Make a prediction function
NewPredictions <- function(model, newdata){
  new.predictions <- predict(object = model, newdata = newdata)
  return(new.predictions)
}

modellist <- vector(mode = 'list')
# Save fitted model here as a file
modellist$modelobject <- presidents
modellist$NewPredictions <- NewPredictions
saveRDS(object = modellist, file = 'presidents.rds')

