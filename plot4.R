## R Code for Plot4

powerData<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerData[,"Date"]<-as.Date(powerData$Date, "%d/%m/%Y")
isFeb <-powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02"
data<-powerData[isFeb,]


##combine date and time to get an accurate time
TotalTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")




data[,"Global_active_power"]<-as.numeric(as.character(data$Global_active_power))
data[,"Global_reactive_power"]<-as.numeric(as.character(data$Global_reactive_power))
data[,"Voltage"]<-as.numeric(as.character(data$Voltage))
data[,"Sub_metering_1"]<-as.numeric(as.character(data$Sub_metering_1))
data[,"Sub_metering_2"]<-as.numeric(as.character(data$Sub_metering_2))
data[,"Sub_metering_3"]<-as.numeric(as.character(data$Sub_metering_3))



png(file = "plot4.png", width = 480, height = 480) 
par(mfrow = c(2,2))
with(data,{
   
        ##uper left corner plot
        par(mar=c(4,4,2,2))
        plot(TotalTime, Global_active_power, type="l", ylab="Global Active Power ", xlab="", lwd=2)
        
        
        ##uper right corner plot
        par(mar=c(4,4,2,2))
        plot(TotalTime, Voltage, type="l", ylab="Voltage", xlab="datetime", lwd=2)
        
        ##Lower left plot
        par(mar=c(4,4,2,2))
        plot(TotalTime, Sub_metering_1, type="l", ylab="Enery sub metering", xlab="", lwd=2)
        par(new=TRUE)
        plot(TotalTime, data$Sub_metering_2, type="l", ylim= range(data$Sub_metering_1), lwd=2, col="red", xlab="", ylab="")
        par(new=TRUE)
        plot(TotalTime, data$Sub_metering_3, type="l", ylim= range(data$Sub_metering_1), lwd=2, col="blue", xlab="", ylab="")
        legend("topright", lwd=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        
        ##Lower right plot
        par(mar=c(4,4,2,2))
        plot(TotalTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", lwd=2)
    
    })
   
dev.off()