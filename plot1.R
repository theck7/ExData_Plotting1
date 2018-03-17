#Course 4 Project 1 Plot 1 

#Load required packages
library(dplyr)

#Read in data
dataset_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data set by date 2007-02-01 and 2007-02-02
dataset_Feb <- filter(dataset_full, Date %in% c("1/2/2007", "2/2/2007"))

#Launch graphics device
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")


#create plot 1
hist(as.numeric(as.character(dataset_Feb$Global_active_power)), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Close graphics device
dev.off()