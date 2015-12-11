hpcData <- read.table("./household_power_consumption.txt", header = TRUE, 
                      stringsAsFactors = FALSE, sep = ";")
temphpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]

temphpcData$DateTime <- paste(temphpcData$Date, temphpcData$Time, sep = " ")
temphpcData$DateTime <- strptime(temphpcData$DateTime, format = "%d/%m/%Y %H:%M:%S")


png("./plot3.png", height = 480, width = 480)
plot(temphpcData$DateTime, temphpcData$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(temphpcData$DateTime, temphpcData$Sub_metering_1)
lines(temphpcData$DateTime, temphpcData$Sub_metering_2, col = "red")
lines(temphpcData$DateTime, temphpcData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "blue", "red"), lty = c(1, 1))
dev.off()