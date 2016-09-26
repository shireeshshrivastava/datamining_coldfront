rates <- read.csv("clean_rainfall.csv",header = T)
rates$date <- as.Date(rates$date, "%Y-%m-%d")
str(rates$date)
range(rates$date)
plot(rates$date, rates$rainfall_amount, type = "l")
head(rates$date, 20)
years <- format(rates$date, "%Y")
tab <- table(years)
tab
mean(tab[1:(length(tab) - 1)])
source("forecast.R")  ## see code file in section 5
result.arima <- forecastArima(rates, n.ahead = 20)
source("plotForecastResult.R")  ## see code file in section 5
plotForecastResult(result.arima, title = "Rainfall forecasting with ARIMA")