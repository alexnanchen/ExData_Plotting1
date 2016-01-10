plot4 <- function() {
    #Load csv file
    data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", 
                     colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                     na.strings="?")
    
    #Some data conversion
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    sdata <- subset(data, DateTime>=as.POSIXlt("2007-02-01 00:00:00") & DateTime<=as.POSIXlt("2007-02-03 00:00:00"))
     
    #Open png graphic device
    png("plot4.png",width=480,height=480)
 
    par(mfrow=c(2,2))
    
    #Plot 1
    with(sdata, plot(DateTime,Global_active_power,type="n", xlab="", ylab="Global Active Power"))
    with(sdata, lines(DateTime,Global_active_power,type="l"))
    
    #Plot 2
    with(sdata, plot(DateTime,Voltage,type="n", xlab="datetime", ylab="voltage"))
    with(sdata, lines(DateTime,Voltage,type="l"))
    
    #Plot 3
    with(sdata, plot(DateTime,Sub_metering_1,type="n", xlab="", ylab="Energy sub metering"))
    with(sdata, lines(DateTime,Sub_metering_1,type="l"))
    with(sdata, lines(DateTime,Sub_metering_3,type="l",col="blue"))
    with(sdata, lines(DateTime,Sub_metering_2,type="l",col="red"))
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
           lty=1,bty="n")
    
    #Plot 4
    with(sdata, plot(DateTime,Global_reactive_power,type="n", xlab="datetime"))
    with(sdata, lines(DateTime,Global_reactive_power,type="l"))
    
    #Output
    invisible(dev.off())
    
    par(mfrow=c(1,1))
}