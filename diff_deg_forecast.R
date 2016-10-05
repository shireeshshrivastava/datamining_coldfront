rates <- read.csv("cleanStuffs.csv",header = T)
rates$date <- as.Date(rates$date, "%Y-%m-%d")
str(rates$date)
range(rates$date)
plot(rates$date,rates$diff_deg, type = "c")
head(rates$date, 20)
years <- format(rates$date, "%Y")
tab <- table(years)
tab
mean(tab[1:(length(tab) - 1)])
source("forecast_diff_deg.R")  ## see code file in section 5
source("plotForecastResult.R")  ## see code file in section 5

# ARIMA MODEL HERE
#result.arima <- forecastArima(rates, n.ahead = 90)
#plotForecastResult(result.arima, title = "Different Degree forecasting with ARIMA")

# STL MODEL HERE
result.stl <- forecastStl(rates, n.ahead = 90)
plotForecastResult(result.stl, title = "Different Degree forecasting with STL")

# STL MODEL WITH DATES
result <- subset(result.stl, date >= "2014-01-01")
plotForecastResult(result, title = "Different Degree forecasting with STL (2014)")