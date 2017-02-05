######### Loading the data (files are already downloaded and unzipped)
consumption<-read.table("./r/electric/household_power_consumption.txt", header = TRUE, sep =";") ## take time, keep patience
cons<-consumption[consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007",]

######### Prepare data
cons["Full_time"] <- paste(cons$Date,cons$Time, sep = " ") ## add new column with full length time and date 
cons$Full_time<- strptime(cons$Full_time, "%d/%m/%Y %H:%M:%S") ## convert to Posix
cons$Global_active_power<- as.numeric(as.character(cons$Global_active_power)) ##convert to numeric format

######### Constructing Plot "Global Active Power"
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
plot(cons$Full_time, cons$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()