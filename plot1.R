setwd("~/RData3/exdata-data-household_power_consumption")
energy <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = "?", stringsAsFactors = FALSE)

str(energy)
summary(energy)

energy$ddd <- energy$Date
feb2007 <- subset(energy, energy$ddd == "1/2/2007" | energy$ddd == "2/2/2007")
str(feb2007)
summary(feb2007)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(feb2007$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col= "red", ylim = c(0,1200))
dev.off()

