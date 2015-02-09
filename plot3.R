path <- "household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";")
##Now we select data only from 2007-02-01 and 2007-02-02
febdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
##format Sub_Metering columns as numeric
febdata$Sub_metering_3 <- as.numeric(as.character(febdata$Sub_metering_3))
febdata$Sub_metering_2 <- as.numeric(as.character(febdata$Sub_metering_2))
febdata$Sub_metering_1 <- as.numeric(as.character(febdata$Sub_metering_1))

## Plot
plot(febdata$datetime, febdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(febdata$datetime, febdata$Sub_metering_2, type="l", col="red")
lines(febdata$datetime, febdata$Sub_metering_3, type="l", col="blue")
##Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

##print graph to png file
dev.copy(png, file="plot3.png")
dev.off()