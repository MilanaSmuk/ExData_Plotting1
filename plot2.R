dataPower <- "~/household_power_consumption.txt"
data <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subPower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subPower$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
