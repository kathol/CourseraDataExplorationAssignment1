hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
hpc1 <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")
ticks <- c(0,nrow(hpc1)/2, nrow(hpc1))
days <- c("Thu","Fri","Sat")

png(file="plot4.png",width=480,height=480)

par(mfrow =c(2,2)) 

## Upper left
hpc2 = data.frame(Time=1:nrow(hpc1),Global_active_power=hpc1$Global_active_power)
with(hpc2,plot( Global_active_power ~ Time , type="n",xlab="",ylab="Global Active Power",xaxt="n"))
with(hpc2,lines( Global_active_power ~ Time , type="l"))
axis(side = 1, at = ticks,labels=days)

## Upper right
hpc2 = data.frame(Time=1:nrow(hpc1),Voltage=hpc1$Voltage)
with(hpc2,plot( Voltage ~ Time , type="n",xlab="datetime",ylab="Voltage",xaxt="n"))
with(hpc2,lines( Voltage ~ Time , type="l"))
axis(side = 1, at = ticks,labels=days)

## Lower left
hpc2 = data.frame(Time=1:nrow(hpc1),SM1=hpc1$Sub_metering_1,SM2=hpc1$Sub_metering_2,SM3=hpc1$Sub_metering_3)
with(hpc2,plot( SM1 ~ Time , type="n",xlab="",ylab="Energy sub metering",xaxt="n"))
with(hpc2,lines( SM1 ~ Time , type="l"))
with(hpc2,lines( SM2 ~ Time , type="l",col="Red"))
with(hpc2,lines( SM3 ~ Time , type="l",col="Blue"))
axis(side = 1, at = ticks,labels=days)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n",lwd=c(2.5,2.5),col=c("black","red","blue"))

## Lower right
hpc2 = data.frame(Time=1:nrow(hpc1),Global_reactive_power=hpc1$Global_reactive_power)
with(hpc2,plot( Global_reactive_power ~ Time , type="n",xlab="datetime",ylab="Global_reactive_power",xaxt="n"))
with(hpc2,lines( Global_reactive_power ~ Time , type="l"))
axis(side = 1, at = ticks,labels=days)

dev.off()