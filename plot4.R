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

# Plot 4
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2), mar = c(4,4,2,2))

with(data_extract,{
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(datetime, Voltage, type ="l")
  plot(datetime, Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
  points(datetime, Sub_metering_2, type ="l", col = "red")
  points(datetime, Sub_metering_3, type ="l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type ="l")
})

dev.off()