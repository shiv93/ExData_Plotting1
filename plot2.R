tempD<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[,1]
tempD<-as.Date(tempD, format="%d/%m/%Y")
temp1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[which(tempD=="2007-02-01"),]
temp2<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[which(tempD=="2007-02-02"),]
elec<-rbind(temp1,temp2)
elec$Global_active_power<-as.numeric(as.character(elec$Global_active_power))
x_lab<-as.POSIXct(paste(as.Date(elec$Date,format="%d/%m/%Y"),elec$Time,sep=" "))
png("plot2.png",width=480,height=480, units="px")
plot(x_lab,elec$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()