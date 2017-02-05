######### Loading the data (files are already downloaded and unzipped)
consumption<-read.table("./r/electric/household_power_consumption.txt", header = TRUE, sep =";") ## take time, keep patience
cons<-consumption[consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007",]

######### Prepare data
cons["Full_time"] <- paste(cons$Date,cons$Time, sep = " ") ## add new column with full length time and date 
cons$Full_time<- strptime(cons$Full_time, "%d/%m/%Y %H:%M:%S") ## convert to Posix
cons$Sub_metering_1<- as.numeric(as.character(cons$Sub_metering_1)) ##convert to numeric format
cons$Sub_metering_2<- as.numeric(as.character(cons$Sub_metering_2)) ##convert to numeric format

######### Constructing Plot "Global Active Power"
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
plot(range(cons$Full_time), range(c(cons$Sub_metering_1,cons$Sub_metering_2,cons$Sub_metering_3)), type='n', bg="transparent", xlab = "", ylab = "Energy sub metering")
lines(cons$Full_time, cons$Sub_metering_1, col='black')
lines(cons$Full_time, cons$Sub_metering_2, col='red')
lines(cons$Full_time, cons$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1, 6, 4), lty = 1) 
dev.off()

