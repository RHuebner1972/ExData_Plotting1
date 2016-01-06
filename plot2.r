# plot2.R
# Rich Huebner
# Jan 5, 2016

setwd("D:\\data\\RProjects\\eda")
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(plotdata$Date, plotdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalap <- as.numeric(plotdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()