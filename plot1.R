### construct the Plot-1

##load required library
library(graphics)
library(grDevices)
library(ggplot2)
library(lattice)
library(plyr)

totalEmission <- aggregate(Emissions ~ year, NEIdata, sum)
totalEmission

plot1 <- function() {
  barplot(
    (totalEmission$Emissions)/10^6,
    names.arg=totalEmission$year,
    xlab="Year",
    ylab="PM2.5 Emissions (10^6 Tons)",
    main="Total PM2.5 Emissions From All US Sources"
  )
  dev.copy(png, file="D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/figure/plot1.png", width=480, height=480)
  dev.off()
}
plot1()
