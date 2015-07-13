#Read in data
data <- read.table("./data/household_power_consumption.txt", header = T,
                   sep = ";", stringsAsFactors = F, dec = ".")

#Get a subset of the data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Get values
globalActivePower <- as.numeric(subData$Global_active_power)

#Send graph to file
png("plot1.png", width = 480, height = 480)

#Graph
hist(globalActivePower, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()