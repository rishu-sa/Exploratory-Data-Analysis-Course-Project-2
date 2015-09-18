### construct the Plot-6

##load required library
library(graphics)
library(grDevices)
library(ggplot2)
library(lattice)
library(plyr)

NEIvehicleBalti<-subset(NEIvehicleSSC, fips == "24510")
NEIvehicleBalti$city <- "Baltimore City"
NEIvehiclela<-subset(NEIvehicleSSC, fips == "06037")
NEIvehiclela$city <- "Los Angeles County"
NEIBothCity <- rbind(NEIvehicleBalti, NEIvehiclela)


plot6 <- function() {
  ggplot(NEIBothCity, aes(x=year, y=Emissions, fill=city))+
  geom_bar(aes(fill=year),stat="identity")+
    facet_grid(.~city) +
    guides(fill=FALSE) + theme_bw() +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
  dev.copy(png, file="D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/figure/plot6.png", width=480, height=480)
  dev.off()
}
plot6()
