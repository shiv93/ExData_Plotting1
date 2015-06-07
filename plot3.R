tempD<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[,1]
tempD<-as.Date(tempD, format="%d/%m/%Y")
temp1<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[which(tempD=="2007-02-01"),]
temp2<-read.table("household_power_consumption.txt",sep=";", header=TRUE)[which(tempD=="2007-02-02"),]
elec<-rbind(temp1,temp2)
x_lab<-as.POSIXct(paste(as.Date(elec$Date,format="%d/%m/%Y"),elec$Time,sep=" "))
elec$Sub_metering_1<-as.numeric(as.character(elec$Sub_metering_1))
elec$Sub_metering_2<-as.numeric(as.character(elec$Sub_metering_2))
elec$Sub_metering_3<-as.numeric(as.character(elec$Sub_metering_3))
png("plot3.png",width=480,height=480,units="px")
with(elec,plot(x_lab,elec$Sub_metering_1,type="n",ylab="Energy Sub metering",xlab=""))
with(elec,lines(x_lab,elec$Sub_metering_1,type="l",ylab="Energy Sub metering",col="black", xlab=""))
with(elec,lines(x_lab,elec$Sub_metering_2,type="l",ylab="Energy Sub metering",col="red", xlab=""))
with(elec,lines(x_lab,elec$Sub_metering_3,type="l",ylab="Energy Sub metering",col="blue",xlab=""))
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"))
dev.off()