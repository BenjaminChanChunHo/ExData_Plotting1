file <- "household_power_consumption.txt"
data <- read.table(file, header = T, sep = ";", na.strings = "?", comment.char = "",
                   nrows = 2075259, stringsAsFactors = F, check.names = F)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_extract <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)          # Remove full data

# Plot 1
hist(data_extract$Global_active_power, col ="red", ylim = c(0, 1200)
     , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()