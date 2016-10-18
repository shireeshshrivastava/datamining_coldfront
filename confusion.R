data = read.csv("confusion_2016.csv")
forecastDegree <- data$V2
forecastColdFront <- c()
forecastRainfall <- data$V1
actualDegree <- data$V4
actualRainfall <- data$V3
actualColdFront <- c()
index = 1

for( i in forecastDegree){
  previousPrevious_day =0
  current_day = 0
  previous_day = 0
  next_day = 0
  if(!(index ==1 || index ==2 || index == length(forecastDegree) -1)){
    previousPrevious_day = forecastDegree[index -2]
    previous_day = forecastDegree[index -1]
    current_day = forecastDegree[index]
    next_day = forecastDegree[index + 1]
  
    if(previousPrevious_day < previous_day && previous_day <= current_day && next_day < current_day){
      if(forecastRainfall[index]>0){
        forecastColdFront<- c(forecastColdFront, 1)
      }else{
        forecastColdFront<- c(forecastColdFront, 0)
      }
    }else{
      forecastColdFront<- c(forecastColdFront, 0)
    }
   }else{
     forecastColdFront<- c(forecastColdFront, 0)
  }
  
  index= index+ 1
}

index = 1

for( i in actualDegree){
  previousPrevious_day =0
  current_day = 0
  previous_day = 0
  next_day = 0
  if(!(index ==1 || index ==2 || index == length(actualDegree) -1)){
    
    previousPrevious_day = actualDegree[index -2]
    previous_day = actualDegree[index -1]
    current_day = actualDegree[index]
    next_day = actualDegree[index + 1]
    
    if(previousPrevious_day <= previous_day && previous_day <= current_day && next_day <= current_day){
      if(actualRainfall[index]>=0){
        actualColdFront<- c(actualColdFront, 1)
      }else{
        actualColdFront<- c(actualColdFront, 0)
      }
    }else{
      actualColdFront<- c(actualColdFront, 0)
    }
  }else{
   
    actualColdFront<- c(actualColdFront, 0)
  }
  index= index+ 1
}

#create some data
library(SDMTools)
obs = actualColdFront
obs = obs[order(obs)]
pred = forecastColdFront
pred = pred[order(pred)]

#calculate the confusion matrix
confusion.matrix(obs,pred,threshold=0.5)