file <- "household_power_consumption.txt"
data <- read.table(file, header = T, sep = ";", na.strings = "?", comment.char = "",
                   nrows = 2075259, stringsAsFactors = F, check.names = F)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_extract <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)          # Remove full data

temp1 <- paste(data_extract$Date, data_extract$Time)
temp2 <- strptime(temp, "%Y-%m-%d %H:%M:%S")
data_extract$datetime <- as.POSIXct(temp2)
rm(temp1, temp2)   # Remove temporary objects

# Plot 2
plot(data_extract$datetime, data_extract$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()