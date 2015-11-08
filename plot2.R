df <- read.table('household_power_consumption.txt',  header =TRUE, sep =';') ## load data
df$DateTime<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") ## Create a new column for Date and Time
df2<-df[which(df$DateTime>="2007-02-01"&df$DateTime<"2007-02-03"),] ## conditional on between the 2 days 
class(df2$Global_active_power)<-"character" ## Change class from factor to character
class(df2$Global_active_power)<-"numeric" ## Change class to numeric

with(df2, plot(DateTime, Global_active_power,xlab ="",ylab = "Global Active Power (kilowatts)",type="l")) ## Create a line graph
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
