# setwd("C:/Users/sjensen/Documents/RProgramming/ExploratoryDataAnalysis")

library(tidyverse)

data_imported <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE) 

data <- mutate(data_imported, Date = as.Date(Date, format = "%d/%m/%Y")) %>%
    filter(Date >= "2007-02-01" & Date <= "2007-02-02")


# Plot 3

png(filename="plot3.png", width=480, height=480)

par(mfrow=c(1,1))

plot(data$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xaxt="n", xlab="")

lines(data$Sub_metering_2, col="red", type="l")

lines(data$Sub_metering_3, col="blue", type="l")

axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'), tck=-.02)

legend(2055, 39.51, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8)

dev.off()