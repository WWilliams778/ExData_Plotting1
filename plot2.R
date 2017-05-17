## Read data from file for measurements from 01/02/2007 to 02/02/2007 (February 1, 2007 - February 2, 2007)
filename <- "household_power_consumption.txt"
tempnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

temp <- read.table (text = grep("^[1,2]/2/2007",readLines(filename), value = TRUE), col.names = tempnames, 
    nrows = 2880, sep = ";", na.strings = "?", header = TRUE)

## Format to Date class
temp$Date <- as.Date(temp$Date, format = "%d/%m/%Y")

## Combine data and time variables
temp$DateTime <- as.POSIXct(paste(temp$Date, temp$Time))


## plot (type = "l" for lines)
plot(temp$Global_active_power ~ temp$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "Global Active Power")


## copy plot to PNG file and close PNG device
dev.copy(png, file = "plot2.png")
dev.off()