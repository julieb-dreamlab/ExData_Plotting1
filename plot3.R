# plot 3 of Exploratory Graphs, week 1 assignment
# by JulieB

# read data
# read top row to get column names
hpcNames <- read.csv("datasets/household_power_consumption/household_power_consumption.txt",
 header = TRUE, sep = ";", nrows = 5)
# use skip and nrows to get a smaller set to work with (runs faster)
hpc <- read.csv("datasets/household_power_consumption/household_power_consumption.txt",
 header = FALSE, sep = ";", na.strings = c("?"), skip = 43200, nrows = 43200)
# add the column names
names(hpc)<-names(hpcNames)
# change the Date class from factor to Date()
hpc$Date<- as.Date(hpc$Date,tryFormats = c("%d/%m/%Y"))

# subset to the desired dates
h2<- subset(hpc,(Date == "2007-02-01") | (Date == "2007-02-02"))

x_times <- strptime(paste(as.character(h2$Date),as.character(h2$Time),sep = " "),
    format = c("%Y-%m-%d %H:%M:%S"))

# add x_times as a column in h2
h2<-cbind(x_times,h2)


png(file = "plot3.png")

with(h2, {
  plot(x_times,Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(x_times, Sub_metering_1, lty = 1, col = "black") 
  lines(x_times, Sub_metering_2, lty = 1, col = "red") 
  lines(x_times, Sub_metering_3, lty = 1, col = "blue") 
  legend("topright",lty = c(1,1,1), col = c("black","red","blue"),
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})    
dev.off()
