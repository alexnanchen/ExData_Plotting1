plot3 <- function() {
    #Load csv file
    data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", 
                     colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                     na.strings="?")
    
    #Some data conversion
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    sdata <- subset(data, DateTime>=as.POSIXlt("2007-02-01 00:00:00") & DateTime<=as.POSIXlt("2007-02-03 00:00:00"))
    
    #Open png graphic device
    png("plot3.png",width=480,height=480)
    
    #Plot
    par(mfrow=c(1,1))
    with(sdata, plot(DateTime,Sub_metering_1,type="n", xlab="", ylab="Energy sub metering"))
    with(sdata, lines(DateTime,Sub_metering_1,type="l"))
    with(sdata, lines(DateTime,Sub_metering_3,type="l",col="blue"))
    with(sdata, lines(DateTime,Sub_metering_2,type="l",col="red"))
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
    
    #Output
    invisible(dev.off())
}