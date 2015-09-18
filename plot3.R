### construct the Plot-3

##load required library
library(graphics)
library(grDevices)
library(ggplot2)
library(lattice)
library(plyr)

plot3 <- function() {
  ggplot(aes(x = year, y = Emissions, fill=type), data=NEIdataBaltimore)+
  geom_bar(stat="identity")+
    facet_grid(.~type)+
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
    guides(fill=FALSE)
  dev.copy(png, file="D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/figure/plot3.png", width=480, height=480)
  dev.off()
}
plot3()
