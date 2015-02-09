path <- "household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";")
##Now we select data only from 2007-02-01 and 2007-02-02
febdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##format numeric columns
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))
febdata$Voltage <- as.numeric(as.character(febdata$Voltage))
febdata$Sub_metering_3 <- as.numeric(as.character(febdata$Sub_metering_3))
febdata$Sub_metering_2 <- as.numeric(as.character(febdata$Sub_metering_2))
febdata$Sub_metering_1 <- as.numeric(as.character(febdata$Sub_metering_1))
febdata$Global_reactive_power <- as.numeric(as.character(febdata$Global_reactive_power))

##create new column for datetime combined data
febdata$datetime <- as.POSIXct(paste(febdata$Date,febdata$Time), format="%d/%m/%Y %H:%M:%S")

##set plot to be 2 cols, 2 rows of plots and set margins
par(mfrow=c(2,2), mar=c(4,4,3,2))

##Make plots
##Plot 1
plot(febdata$datetime, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")

##Plot 2
plot(febdata$datetime, febdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot 3
plot(febdata$datetime, febdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(febdata$datetime, febdata$Sub_metering_2, type="l", col="red")
lines(febdata$datetime, febdata$Sub_metering_3, type="l", col="blue")
##Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n", cex=0.7)

##Plot 4
plot(febdata$datetime, febdata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

##print graph to png file
dev.copy(png, file="plot4.png")
dev.off()