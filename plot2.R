#
# Exploratory Data Analysis
# Project 1, Plot 2
# 13July2014
#
#

# Specify format for myDate to read in date values
        setAs("character","myDate",function(from) as.Date(from,format="%d/%m/%Y"))

# Specify column classes in vector
        col_classes <- c("myDate","character",rep("numeric",7))

# read in subset of table for 2007-2-1 and 2007-2-2 dates only from project1 folder in working directory
        electuse <- subset(read.table("./project1/household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",colClasses=col_classes),Date=="2007-2-1"|Date=="2007-2-2")

# Combine Date and Time Column and Specify Format
        electuse$datetime <- strptime(paste(electuse$Date, electuse$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")

# Save plot to .png in project1 folder of working directory
        png(filename ="./project1/plot2.png", width = 480, height = 480)
        
# Plot 2
        with(electuse, plot(electuse$datetime, electuse$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab=""))

# Turn off plotting device
        dev.off()