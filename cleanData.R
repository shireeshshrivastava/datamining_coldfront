library(pracma)
rates <- read.csv("Raw_rainfall_1985_2015_zero.csv",header = T)
date <- paste(rates$Year, rates$Month, rates$Day, sep="-")
rates2 <- read.csv("temp_diff_1985_2015_zero.csv", header=T)
diff_deg <- rates2$temp_diff
rainfall <- rates$rainfall
diff_deg <- hampel(diff_deg, k =10)
rainfall <- hampel(rainfall, k =10)
rainfall <- rainfall$y
diff_deg <- diff_deg$y
#realData <- cbind(date, diff_deg, rainfall)
date<- as.Date(date, "%Y-%m-%d")
plot(date, rates2$temp_diff, type="l")
plot(date, diff_deg, type="l")
#convert NA into 0
#diff_deg <- diff_deg[which(is.na(diff_deg))] <- 0
#rainfall <- rainfall[(is.na(rainfall))] <- 0