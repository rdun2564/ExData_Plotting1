setwd("~/RData3/exdata-data-household_power_consumption")
energy <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?", stringsAsFactors = FALSE)

str(energy)
summary(energy)

energy$ddd <- energy$Date
feb2007 <- subset(energy, energy$ddd == "1/2/2007" | energy$ddd == "2/2/2007")
feb2007$dtetch <- paste(feb2007$ddd," ",feb2007$Time,sep="")
feb2007$dtet <- strptime(feb2007$dtetch, format= "%d/%m/%Y %H:%M:%S")

str(feb2007)
summary(feb2007)

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2), mar = c(6,4,1,1))

with(feb2007, plot(feb2007$dtet,feb2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(feb2007, plot(dtet,Sub_metering_1, xlab = "",ylab = "Energy sub metering", type = "n"))
with(feb2007, points(dtet, Sub_metering_1, type = "l", col= "black"))
with(feb2007, points(dtet, Sub_metering_2, type = "l", col= "red"))
with(feb2007, points(dtet, Sub_metering_3, type = "l", col= "blue"))
legend("topright", pch = c(NA,NA,NA), col=c("black", "red", "blue"), lwd = 1, lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


with(feb2007, plot(dtet,Voltage, type = "l", xlab = "datetime"))
with(feb2007, plot(dtet,Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()
