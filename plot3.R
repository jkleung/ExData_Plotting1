df <- read.table('household_power_consumption.txt',  header =TRUE, sep =';') ## load data
df$DateTime<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") ## Create a new column for Date and Time
df2<-df[which(df$DateTime>="2007-02-01"&df$DateTime<"2007-02-03"),] ## conditional on between the 2 days 
class(df2$Global_active_power)<-"character" ## Change class from factor to character
class(df2$Global_active_power)<-"numeric" ## Change class to numeric

par(mfrow=c(1,1))
with(df2, plot(DateTime, Sub_metering_1,xlab ="",ylab = "Energy Sub Metering",type="l")) ## Create a line graph
with(subset(df2), lines(DateTime, Sub_metering_2, col = "red"))
with(subset(df2), lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
