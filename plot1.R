# setwd("C:/Users/sjensen/Documents/RProgramming/ExploratoryDataAnalysis")

library(tidyverse)

data_imported <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE) 

data <- mutate(data_imported, Date = as.Date(Date, format = "%d/%m/%Y")) %>%
    filter(Date >= "2007-02-01" & Date <= "2007-02-02")


# Plot 1

png(filename="plot1.png", width=480, height=480)

par(mfrow=c(1,1))

hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()