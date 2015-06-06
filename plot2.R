hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
hpc1 <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")
ticks <- c(0,nrow(hpc1)/2, nrow(hpc1))
days <- c("Thu","Fri","Sat")

png(file="plot2.png",width=480,height=480)

hpc2 = data.frame(Time=1:nrow(hpc1),Global_active_power=hpc1$Global_active_power)
with(hpc2,plot( Global_active_power ~ Time , type="n",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n"))
with(hpc2,lines( Global_active_power ~ Time , type="l"))
axis(side = 1, at = ticks,labels=days)

dev.off()