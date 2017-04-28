dataPower <- "~/household_power_consumption.txt"
data <- read.table(dataPower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subPower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subPower$Global_active_power)
grp <- as.numeric(subPower$Global_reactive_power)
volt<- as.numeric(subPower$Voltage)
sm1 <- as.numeric(subPower$Sub_metering_1)
sm2 <- as.numeric(subPower$Sub_metering_2)
sm3 <- as.numeric(subPower$Sub_metering_3)

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
##1st graphic
plot(datetime, gap, type = "l", xlab = " ", ylab = "Global Active Power")
##2nd graphic, comes in 1st row, 2nd position
plot(datetime, volt, type = "l", ylab = "Voltage")
##3rd graphic 
plot(datetime, sm1, type = "l", xlab = " " , ylab = "Energy sub metering")
lines(datetime, sm2, type = "l", col = "red")
lines(datetime, sm3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"), lty = 1,lwd = 2, bty="n")
##4th graphic
plot(datetime, grp, ylab = "Global_reactive_power", type = "l")
dev.off()
