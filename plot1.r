# plot1.R
# Rich Huebner
# Jan 5, 2016

setwd("D:\\data\\RProjects\\eda")
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
plotdata <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

globalap <- as.numeric(plotdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalap, col = "red", main = "Global Active Power", xlab = "(kilowatts)")
dev.off()
