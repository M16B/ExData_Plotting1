#Read in Data
data <- read.table("./data/household_power_consumption.txt", header = T,
                   sep = ";", stringsAsFactors = F, dec = ".")

#Get subset of data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Get x axis values
time <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "),
                     "%d/%m/%Y %H:%M:%S")

#Get y axis values
globalActivePower <- as.numeric(subData$Global_active_power)

#Lines
Sub_Metering_1 <- as.numeric(subData$Sub_metering_1)
Sub_Metering_2 <- as.numeric(subData$Sub_metering_2)
Sub_Metering_3 <- as.numeric(subData$Sub_metering_3)

#send to file
png("plot3.png", width = 480, height = 480)

#Graph
plot(time, Sub_Metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(time, Sub_Metering_2, type = "l", col = "red")
lines(time, Sub_Metering_3, type = "l", col = "blue")

#Create Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()