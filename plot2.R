## Download and unzip the data if it does not already exist
if (!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data_zipped")
  unzip("data_zipped")
}

## Read in data
df <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Subset to required data
df_sub <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

## Convert date to datetime
df_sub$DateTime <- strptime(paste(df_sub$Date, df_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Initiate png file
png("plot2.png", width=480, height=480)

## Create plot
plot(df_sub$DateTime, df_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close png file
dev.off()
