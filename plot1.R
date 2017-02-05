######### Loading the data (files are already downloaded and unzipped)
consumption<-read.table("./r/electric/household_power_consumption.txt", header = TRUE, sep =";") ## take time, keep patience

######### Prepare data
cons<-consumption[consumption$Date=="1/2/2007" | consumption$Date=="2/2/2007",]
cons$Global_active_power<- as.numeric(as.character(cons$Global_active_power)) ##convert to numeric format

######### Constructing Plot "Global Active Power"
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(cons$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency" , col="red", main = "Global Active Power")
dev.off()