hpcData <- read.table("./household_power_consumption.txt", header = TRUE, 
                      stringsAsFactors = FALSE, sep = ";")
temphpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]

temphpcData$DateTime <- paste(temphpcData$Date, temphpcData$Time, sep = " ")
temphpcData$DateTime <- strptime(temphpcData$DateTime, format = "%d/%m/%Y %H:%M:%S")

png("./plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))

# Plot 1
plot(temphpcData$DateTime, temphpcData$Global_active_power, type = "n", 
     ylab = "Global Active Power", xlab = "")
lines(temphpcData$DateTime, temphpcData$Global_active_power)

# Plot 2
plot(temphpcData$DateTime, temphpcData$Voltage, type = "n", 
     ylab = "Voltage", xlab = "datetime")
lines(temphpcData$DateTime, temphpcData$Voltage)

# Plot 3
plot(temphpcData$DateTime, temphpcData$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(temphpcData$DateTime, temphpcData$Sub_metering_1)
lines(temphpcData$DateTime, temphpcData$Sub_metering_2, col = "red")
lines(temphpcData$DateTime, temphpcData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "blue", "red"), lty = c(1, 1), bty = "n")

# Plot 4
plot(temphpcData$DateTime, temphpcData$Global_reactive_power, type = "n", 
     ylab = "Global_reactive_power", xlab = "datetime")
lines(temphpcData$DateTime, temphpcData$Global_reactive_power)

dev.off()