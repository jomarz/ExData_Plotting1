path <- "household_power_consumption.txt"
data <- read.table(path, header=TRUE, sep=";")
##Now we select data only from 2007-02-01 and 2007-02-02
febdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
##format Global Cative Power as numeric
febdata$Global_active_power <- as.numeric(as.character(febdata$Global_active_power))
##Make the histogram
hist(febdata$Global_active_power,  col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency", ylim=c(0,1200))
##print graph to png file
dev.copy(png, file="plot1.png")
dev.off()