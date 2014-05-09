## R Code for Plot2

powerData<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerData[,"Date"]<-as.Date(powerData$Date, "%d/%m/%Y")
isFeb <-powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02"
data<-powerData[isFeb,]


##combine date and time to get an accurate time
TotalTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data[,"Global_active_power"]<-as.numeric(as.character(data$Global_active_power))

##increase the line width slightly
plot(TotalTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", lwd=2)

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()