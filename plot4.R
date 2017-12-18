# setwd("C:/Users/sjensen/Documents/RProgramming/ExploratoryDataAnalysis")

library(tidyverse)

data_imported <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE) 

data <- mutate(data_imported, Date = as.Date(Date, format = "%d/%m/%Y")) %>%
    filter(Date >= "2007-02-01" & Date <= "2007-02-02")


# Plot 4

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# 1
plot(data$Global_active_power , type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'), tck=-.02)

# 2
plot(data$Voltage , type="l", ylab="Voltage", xaxt="n", xlab="datetime")
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'), tck=-.02)

# 3
plot(data$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xaxt="n", xlab="")
lines(data$Sub_metering_2, col="red", type="l")
lines(data$Sub_metering_3, col="blue", type="l")
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'), tck=-.02)
legend(1375, 39.51, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, bty="n", cex=0.8)

# 4
plot(data$Global_reactive_power , type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'), tck=-.02)

dev.off()