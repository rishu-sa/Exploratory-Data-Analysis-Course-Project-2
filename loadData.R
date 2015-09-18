### load data into R

## read data from RDS files
NEI <- readRDS("D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("D:/Coursera/ExploratoryAnalysis/Assignment/CourseProject-2/exdata-data-NEI_data/Source_Classification_Code.rds")


## Converting "year", "type", "Pollutant", "SCC", "fips" to factor
columnFact <- c("year", "type", "Pollutant","SCC","fips")
NEI[,columnFact] <- lapply(NEI[,columnFact], factor)

## The levels have NA as "   NA", removing the empty space
levels(NEI$fips)[1] = NA
NEIdata<-NEI[complete.cases(NEI),]
colSums(is.na(NEIdata))
