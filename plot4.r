# plot4.r
# Rich Huebner
# Jan 6, 2016

setwd("D:\\data\\RProjects\\eda")
f <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- f[f$Date %in% c("1/2/2007", "2/2/2007"),] # date format is  dd/mm/yyyy

dt <- strptime(paste(plotdata$Date, plotdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(plotdata$Global_active_power)    # gap = global active power
grp <- as.numeric(plotdata$Global_reactive_power)  # grp = global reactice power

volt <- as.numeric(plotdata$Voltage)
sm1 <- as.numeric(plotdata$Sub_metering_1)
sm2 <- as.numeric(plotdata$Sub_metering_2)
sm3 <- as.numeric(plotdata$Sub_metering_3)
graphlabels <- c("Sub Metering 1", "SUb Metering 2", "Sub Metering 3")
labcolors <- c("black", "red", "blue")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(dt, gap, type="l", xlab="", ylab="Global Active Power")
plot(dt, volt, type="l", xlab="Date/Time", ylab="Voltage")

plot(dt, sm1, type="l", xlab="", ylab="Energy Submetering")
   lines(dt, sm2, type="l", col="red")
   lines(dt, sm3, type="l", col="blue")
legend("topright", graphlabels, lty=, lwd=2.5, col= labcolors, bty="o")

plot(dt, grp, type="l", xlab="Date/Time", ylab="Global Reactive Power")

dev.off()