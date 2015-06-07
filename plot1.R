tempD<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[,1]
tempD<-as.Date(tempD, format="%d/%m/%Y")
temp1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[which(tempD=="2007-02-01"),]
temp2<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[which(tempD=="2007-02-02"),]
elec<-rbind(temp1,temp2)
elec$Global_active_power<-as.numeric(as.character(elec$Global_active_power))
png("plot1.png",width=480, height=480, units="px")
hist(elec$Global_active_power, xlab="Global Active Power(kilowatts)",col="Red", main="Global Active Power")
dev.off()


