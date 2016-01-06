# plot3.r
# Rich Huebner
# Jan 5, 2016

setwd("D:\\data\\RProjects\\eda")
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),] # date format is  dd/mm/yyyy

dt <- strptime(paste(plotdata$Date, plotdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalap <- as.numeric(plotdata$Global_active_power)
sm1 <- as.numeric(plotdata$Sub_metering_1)
sm2 <- as.numeric(plotdata$Sub_metering_2)
sm3 <- as.numeric(plotdata$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

