#Read in data
data <- read.table("./data/household_power_consumption.txt", header=TRUE,
                   sep=";", stringsAsFactors=FALSE, dec=".")

#Get subset of Data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Get x axis variables
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

#Get y axis Variables
globalActivePower <- as.numeric(subData$Global_active_power)

#Send Graph to File
png("plot2.png", width=480, height=480)

#Graph
plot(datetime, globalActivePower, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()