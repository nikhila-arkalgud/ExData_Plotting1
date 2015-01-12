#R script for creating plot3.png
#Global Active Power vs dates

#read only data from 1/2/2007 to 2/2/2007 from the file
power<- data.frame(fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings="?"))

#convert data character string into date type using as.Date() function
power[,1]<-as.Date(power[,1],"%d/%m/%Y")
power$DateTime<-paste(power$V1,power$V2)
power$DateTime<- strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S")

#create a png file of the plot
png(file="plot3.png",width=480,height=480)

#plot a line graphs for energy submetering stored in columns 7, 8 and 9
par(bg="transparent")
plot(power$DateTime,power$V7,type="l",ylab="Energy sub metering",xlab="")
points(power$DateTime,power$V8,col="red", type="l")
points(power$DateTime,power$V9,col="blue", type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(1,1,1))

#store the plot in a png file
dev.off()