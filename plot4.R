df <- read.table('household_power_consumption.txt',  header =TRUE, sep =';') ## load data
df$DateTime<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") ## Create a new column for Date and Time
df2<-df[which(df$DateTime>="2007-02-01"&df$DateTime<"2007-02-03"),] ## conditional on between the 2 days 
class(df2$Global_active_power)<-"character" ## Change class from factor to character
class(df2$Global_active_power)<-"numeric" ## Change class to numeric

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(df2, plot(DateTime, Global_active_power,xlab ="",ylab = "Global Active Power (kilowatts)",type="l")) ## Create a line graph

with(df2, plot(DateTime, Voltage,xlab ="datetime",ylab = "Voltage",type="l")) ## Create a line graph

with(df2, plot(DateTime, Sub_metering_1,xlab ="",ylab = "Energy Sub Metering",type="l",cex.lab=0.8)) ## Create a line graph
with(subset(df2), lines(DateTime, Sub_metering_2, col = "red"))
with(subset(df2), lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=0.8)

with(df2, plot(DateTime, Global_reactive_power,xlab ="datetime",ylab = "Global_reactive_power",type="l")) ## Create a line graph

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
