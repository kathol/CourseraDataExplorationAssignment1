hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
hpc1 <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")
ticks <- c(0,nrow(hpc1)/2, nrow(hpc1))
days <- c("Thu","Fri","Sat")

png(file="plot3.png",width=480,height=480)

hpc2 = data.frame(Time=1:nrow(hpc1),SM1=hpc1$Sub_metering_1,SM2=hpc1$Sub_metering_2,SM3=hpc1$Sub_metering_3)
with(hpc2,plot( SM1 ~ Time , type="n",xlab="",ylab="Energy sub metering",xaxt="n"))
with(hpc2,lines( SM1 ~ Time , type="l"))
with(hpc2,lines( SM2 ~ Time , type="l",col="Red"))
with(hpc2,lines( SM3 ~ Time , type="l",col="Blue"))
axis(side = 1, at = ticks,labels=days)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))

dev.off()