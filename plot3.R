dataPower <- "~/household_power_consumption.txt"
data <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subPower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(subPower$Sub_metering_1)
sm2 <- as.numeric(subPower$Sub_metering_2)
sm3 <- as.numeric(subPower$Sub_metering_3)

png("plot3.png", height = 480, width = 480)
plot(datetime, sm1, type = "l", xlab = " " , ylab = "Energy sub metering")
lines(datetime, sm2, type = "l", col = "red")
lines(datetime, sm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"), lty=1, lwd=2)
dev.off()
