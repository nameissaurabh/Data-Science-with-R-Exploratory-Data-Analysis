data <- subset(read.table("E:/coursera/data science with r/exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";"),Date %in% c("1/2/2007","2/2/2007"))
timedate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, timedate)
png("plot3.png",width=480,height=480)
with(data,plot(timedate,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(data$timedate,data$Sub_metering_2,col="red")
lines(data$timedate,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
