plotForecastResult <- function(x, title=NULL) {
  x <- x[order(x$date),]
  max.val <- max(c(x$actual, x$upper), na.rm=T)
  min.val <- min(c(x$actual, x$lower), na.rm=T)
  plot(x$date, x$actual, type="l", col="grey", main=title,
       xlab="Time (Years)", ylab="Rainfall Amount",
       xlim=range(x$date), ylim=c(min.val, max.val))
  
  grid()
  lines(x$date, x$trend, col="green")
  lines(x$date, x$pred, col="red")
  lines(x$date, x$lower, col="blue")
  lines(x$date, x$upper, col="blue")
  legend("topleft", col=c("grey", "green", "red", "blue"), lty=1,
         c("Actual", "Trend", "Forecast", "Lower/Upper Bound"))
}