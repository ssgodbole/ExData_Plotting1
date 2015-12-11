hpcData <- read.table("./household_power_consumption.txt", header = TRUE, 
                      stringsAsFactors = FALSE, sep = ";")
temphpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]

temphpcData$DateTime <- paste(temphpcData$Date, temphpcData$Time, sep = " ")
temphpcData$DateTime <- strptime(temphpcData$DateTime, format = "%d/%m/%Y %H:%M:%S")


png("./plot2.png", height = 480, width = 480)
plot(temphpcData$DateTime, temphpcData$Global_active_power, type = "n", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
lines(temphpcData$DateTime, temphpcData$Global_active_power)
dev.off()