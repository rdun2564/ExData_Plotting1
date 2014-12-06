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

png(filename = "plot2.png", width = 480, height = 480, units = "px")
par(mar = c(4,4,1,1))
plot(feb2007$dtet,feb2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

