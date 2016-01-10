plot1 <- function() {
    #Load csv file
    data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", 
                     colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                     na.strings="?")
    
    #Some data conversion
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    sdata <- subset(data, DateTime>=as.POSIXlt("2007-02-01 00:00:00") & DateTime<=as.POSIXlt("2007-02-03 00:00:00"))
    
    #Open png graphic device
    png("plot1.png",width=480,height=480)
    
    #Plot
    par(mfrow=c(1,1))
    hist(sdata$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")

    #Output
    invisible(dev.off())
}