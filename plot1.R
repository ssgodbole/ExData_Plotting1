
hpcData <- read.table("./household_power_consumption.txt", header = TRUE, 
                      stringsAsFactors = FALSE, sep = ";")
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]

png("./plot1.png", height = 480, width = 480)
hist(as.numeric(hpcData$Global_active_power),
     col = "red", main = "Global Active Power", las = 1, 
     xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))
dev.off()