dataFile <- "data/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(subSetData$Voltage)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)


# Creates Plot
png("plot4.png", width = 480, height = 480)

# Sets up 2x2 multiPlot
par(mfrow = c(2, 2))

# Upper Left Plot
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

# Upper Right Plot
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Lower Left Plot
plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col="red")
lines(datetime, subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty="n")

# Lower Right Plot
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()