path <- "household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";")
##Now we select data only from 2007-02-01 and 2007-02-02
febdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
##format Global Cative Power as numeric
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))
##create new column for datetime combined data
febdata$datetime<-as.POSIXct(paste(febdata$Date,febdata$Time), format="%d/%m/%Y %H:%M:%S")

##Plot
plot(febdata$datetime, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")

##print graph to png file
dev.copy(png, file="plot2.png")
dev.off()