dataPower <- "~/household_power_consumption.txt"
data <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subPower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

gap <- as.numeric(subPower$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", ylab = "Frequency")
dev.off()