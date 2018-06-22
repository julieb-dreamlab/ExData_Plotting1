# plot 2 of Exploratory Graphs, week 1 assignment
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

png(file = "plot2.png")

plot(x_times,h2$Global_active_power, type = "n", 
    xlab = "", ylab = "Global Active Power (kilowatts)")
#points(pch = ".")
lines(x_times,h2$Global_active_power,lty = 1, lwd = 1)
dev.off()
