# setwd("C:/Users/sjensen/Documents/RProgramming/ExploratoryDataAnalysis")

library(tidyverse)

data_imported <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE) 

data <- mutate(data_imported, Date = as.Date(Date, format = "%d/%m/%Y")) %>%
    filter(Date >= "2007-02-01" & Date <= "2007-02-02")


# Plot 2

png(filename="plot2.png", width=480, height=480)

par(mfrow=c(1,1))

plot(data$Global_active_power , type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(side=1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'), tck=-.02)

dev.off()