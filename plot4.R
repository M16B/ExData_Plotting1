#Read in Data
data <- read.table("./data/household_power_consumption.txt", header = T,
                   sep = ";", stringsAsFactors = F, dec = ".")

#Get subset of data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Get values for the four graphs
time <- strptime(paste(subData$Date, subData$Time, sep = " "),
                     "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
Sub_Metering_1 <- as.numeric(subData$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subData$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subData$Sub_metering_3)

#Send Graph to file
png("plot4.png", width = 480, height = 480)

#Separate Graph into four areas
par(mfrow = c(2, 2)) 

#Graph
plot(time, globalActivePower, type = "l", xlab = "",
     ylab = "Global Active Power", cex = 0.2)

plot(time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(time, Sub_Metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(time, Sub_Metering_2, type = "l", col = "red")
lines(time, Sub_Metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

plot(time, globalReactivePower, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()