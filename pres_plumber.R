
# Environment
library(plumber)
library(randomForest)
#* return the input
#* 
#* @get /patrol

function(messg = ""){
  list(messg = paste0("Hi I am listening '", messg, "'"))
}

## Load the model
modellist = readRDS("presidents.rds")

## Lets make a prediction

#* @param number
#* @get /predict
predictions <- function(number)
{
  number <- as.numeric(number)
  
  
  X.new <- data.frame(number = number)
  
  #predict based on input
  
  ##predict(presidents.rds, new_data = X.new, type = "class")
  y.pred <- modellist$NewPredictions(model = modellist$modelobject, newdata = X.new)
  return(y.pred)
}

