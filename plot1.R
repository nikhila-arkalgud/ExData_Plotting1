#R script for creating plot1.png
#Histogram for Global Active Power

#read only data from 1/2/2007 to 2/2/2007 from the file
power<- data.frame(fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings="?"))

#convert data character string into date type using as.Date() function
power[,1]<-as.Date(power[,1],"%d/%m/%Y")
power$DateTime<-paste(power$V1,power$V2)
power$DateTime<- strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S")

#create a png file of the plot
png(file="plot1.png",width=480,height=480)

#plot a histogram for the Global Active power, stored in 3rd column
par(bg="transparent")
hist(power[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#store the plot in a png file
dev.off()