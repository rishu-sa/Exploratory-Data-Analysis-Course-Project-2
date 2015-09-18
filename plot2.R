### construct the Plot-2

##load required library
library(graphics)
library(grDevices)
library(ggplot2)
library(lattice)
library(plyr)

NEIdataBaltimore<-subset(NEIdata, fips == "24510")
totalEmissionBaltimore <- aggregate(Emissions ~ year, NEIdataBaltimore, sum)
totalEmissionBaltimore

plot2 <- function() {
  barplot(
    (totalEmissionBaltimore$Emissions)/10^6,
    names.arg=totalEmissionBaltimore$year,
    xlab="Year",
    ylab="PM2.5 Emissions (10^6 Tons)",
    main="Total PM2.5 Emissions From All Baltimore City Sources"
  )
  dev.copy(png, file="D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/figure/plot2.png", width=480, height=480)
  dev.off()
}
plot2()
