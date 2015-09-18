### construct the Plot-5

##load required library
library(graphics)
library(grDevices)
library(ggplot2)
library(lattice)
library(plyr)

SCCvehicle<-grepl(pattern = "vehicle", SCC$EISector, ignore.case = TRUE)
SCCvehicleSCC <- SCC[SCCvehicle,]$SCC

## using this boolean vector get the interested rows from the baltimore data
NEIvehicleSSC <- NEIdata[NEIdata$SCC %in% SCCvehicleSCC, ]
NEIvehicleBaltimore <- subset(NEIvehicleSSC, fips == "24510")
NIEvehicleBaltimoreTotEm<-aggregate(Emissions~year, NEIvehicleBaltimore, sum)


plot5 <- function() {
  ggplot(aes(year, Emissions/10^5), data=NIEvehicleBaltimoreTotEm)+
    geom_bar(stat="identity",fill="grey",width=0.75) +
    guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
  dev.copy(png, file="D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/figure/plot5.png", width=480, height=480)
  dev.off()
}
plot5()
