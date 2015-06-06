hpc <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
hpc1 <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")

png(file="plot1.png",width=480,height=480)

hist(hpc1$Global_active_power, xlab = "Global Active Power (kilowatts)",main="Global Active Power",col="red")

dev.off()
