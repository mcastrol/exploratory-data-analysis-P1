source("../datos/read_data.R")
setwd("~/MEGA/MEGAsync/DATA-SCIENCE/work/c4-w1-project/1graphs")
par(mfrow=c(2,2),mar=c(4,4,2,1))
#plot 1.1
plot(pow_consumption$DateTime,pow_consumption$Global_active_power,ylab="Global Active Power (kilowatts)", xlab='',type='l')
#plot 1.2
plot(pow_consumption$DateTime,pow_consumption$Voltage,ylab="Voltage", xlab='datetime',type='l')
#plot 1.3
plot(pow_consumption$DateTime, pow_consumption$Sub_metering_1,ylab="Energy Sub Metering", type='l',xlab=" ",col="black")
lines(pow_consumption$DateTime,pow_consumption$Sub_metering_2,col="red")
lines(pow_consumption$DateTime,pow_consumption$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty="solid",lwd=1, cex=.5)
#plot 1.4
plot(pow_consumption$DateTime,pow_consumption$Global_reactive_power,ylab="Global_reactive_power", xlab='datetime',type='l')
dev.copy(png,"Plot4.png",width=480,height=480,units='px')
dev.off()