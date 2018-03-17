#Course 4 Project 1 Plot 2

#Load required packages
library(dplyr)

#Read in data
dataset_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data set by date 2007-02-01 and 2007-02-02 and add date/time column
dataset_Feb <- dataset_full %>% 
               filter(Date %in% c("1/2/2007", "2/2/2007")) %>% 
               mutate(DateTime = paste(Date, Time))

#convert the Date/Time variables to Date/Time classes
dataset_Feb$DateTime <- strptime(dataset_Feb$DateTime, "%d/%m/%Y %H:%M:%S")

#Launch graphics device
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

#create plot 2
with(dataset_Feb,plot(DateTime, as.numeric(as.character(Global_active_power)), 
                      type = "l", 
                      ylab = "Global Active Power (kilowatts)",
                      xlab = ""))

#Close graphics device
dev.off()
