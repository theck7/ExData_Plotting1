#Course 4 Project 1 Plot 4

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
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

#allow for multiple panels
par(mfrow = c(2, 2))

#Create Plots
with(dataset_Feb, {
     
    #create plot Top Left
    plot(DateTime, as.character(Global_active_power), 
           type = "l", 
           ylab = "Global Active Power",
           xlab = "")
    
    #create plot Top Right    
    plot(DateTime, as.character(Voltage), 
           type = "l", 
           ylab = "Voltage",
           xlab = "datetime")
    
    #create plot Bottom Left
    plot(DateTime, as.character(Sub_metering_1), 
           type = "l", 
           ylab = "Energy sub metering",
           xlab = "")

    lines(dataset_Feb$DateTime, as.character(dataset_Feb$Sub_metering_2), 
           type = "l", 
           col = "red")
    lines(dataset_Feb$DateTime, as.character(dataset_Feb$Sub_metering_3), 
            type = "l", 
            col = "blue")
    legend("topright",
            legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"), 
            lty = 1,
            bty = "n",
            pt.cex = 1,
            cex = .95)
    
    #create plot Bottom Right  
    plot(DateTime, as.character(Global_reactive_power), 
            type = "l", 
            ylab = "Global_reactive_power",
            xlab = "datetime")
  
})

#Close graphics device
dev.off()
