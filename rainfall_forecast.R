#library(caret)
rates <- read.csv("cleanStuffs.csv",header = T)
rates$date <- as.Date(rates$date, "%Y-%m-%d")
str(rates$date)
range(rates$date)
plot(rates$date,rates$rainfall )
head(rates$date, 20)
years <- format(rates$date, "%Y")
tab <- table(years)
tab
mean(tab[1:(length(tab) - 1)])
source("forecast.R")  ## see code file in section 5
source("plotForecastResult.R")  ## see code file in section 5

# ARIMA MODEL HERE
result.arima <- forecastArima(rates, n.ahead = 250)
plotForecastResult(result.arima, title = "Rainfall forecasting with ARIMA")

#STL MODEL HERE
result.stl <- forecastStl(rates, n.ahead = 250)
plotForecastResult(result.stl, title = "Rainfall forecasting with STL")
#STL MODEL WITH DATES
result <- subset(result.stl, date >= "2016-01-01")
plotForecastResult(result, title = "Rainfall forecasting with STL (2014)")

#predicted_rainfall_amount <- na.omit(result.stl$pred, na.rm=TRUE)
#write.csv(predicted_rainfall_amount, file="predicted_2016.csv", row.names=FALSE)