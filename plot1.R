df <- read.table('household_power_consumption.txt',  header =TRUE, sep =';') ## load data
df$DateTime<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") ## Create a new column for Date and Time
df2<-df[which(df$DateTime>="2007-02-01"&df$DateTime<"2007-02-03"),] ## conditional on between the 2 days 
class(df2$Global_active_power)<-"character" ## Change class from factor to character
class(df2$Global_active_power)<-"numeric" ## Change class to numeric


hist(df2$Global_active_power,main = "Global Active Power",col="red",xlab="Global Active Power (kilowatts)") ## Create a histogram
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
