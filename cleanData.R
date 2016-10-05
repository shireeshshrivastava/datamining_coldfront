rates <- read.csv("daily_temp_diff.csv",header = T)
rates2 <- read.csv("raw_rainfall.csv", header=T)
date <- paste(rates$Year, rates$Month, rates$Day, sep="-")
str(date)
diff_deg <- rates$diff_degree
rainfall_amount <- rates2$Rainfall_amount
realData <- cbind(date, diff_deg, rainfall_amount)
write.csv(realData, file="cleanStuffs.csv",row.names=F)