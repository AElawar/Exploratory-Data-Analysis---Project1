## Load the whole dataset
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Format the date
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subset the dataset
sub_power <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the dates
datetime <- paste(as.Date(sub_power$Date), sub_power$Time)
sub_power$Datetime <- as.POSIXct(datetime)

## Generate Plot 1
hist(sub_power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Output to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()