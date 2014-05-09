
##R code for generating plot1

powerData<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
powerData[,"Date"]<-as.Date(powerData$Date, "%d/%m/%Y")
isFeb <-powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02"
data<-powerData[isFeb,]
data[,"Global_active_power"]<-as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
