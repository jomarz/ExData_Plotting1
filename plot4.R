path <- "household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";")
##Now we select data only from 2007-02-01 and 2007-02-02
febdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

##format numeric columns
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))
febdata$Sub_metering_3 <- as.numeric(as.character(febdata$Sub_metering_3))
febdata$Sub_metering_2 <- as.numeric(as.character(febdata$Sub_metering_2))
febdata$Sub_metering_1 <- as.numeric(as.character(febdata$Sub_metering_1))

