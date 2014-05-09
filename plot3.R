## R Code for Plot3 

powerData<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerData[,"Date"]<-as.Date(powerData$Date, "%d/%m/%Y")
isFeb <-powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02"
data<-powerData[isFeb,]


##combine date and time to get an accurate time
TotalTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data[,"Sub_metering_1"]<-as.numeric(as.character(data$Sub_metering_1))
data[,"Sub_metering_2"]<-as.numeric(as.character(data$Sub_metering_2))
data[,"Sub_metering_3"]<-as.numeric(as.character(data$Sub_metering_3))

##increase the line width slightly
plot(TotalTime, data$Sub_metering_1, type="l", ylab="Enery sub metering", xlab="", lwd=2)
par(new=TRUE)
plot(TotalTime, data$Sub_metering_2, type="l", ylim= range(data$Sub_metering_1), lwd=2, col="red", xlab="", ylab="")
par(new=TRUE)
plot(TotalTime, data$Sub_metering_3, type="l", ylim= range(data$Sub_metering_1), lwd=2, col="blue", xlab="", ylab="")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()