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

## Generate Plot3
with(sub_power, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1,  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.70, y.intersp=0.2, bty='n')

## Output to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()