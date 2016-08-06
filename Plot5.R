### Exploratory Data Analysis
### Course Project 
### By Navid Lambert-Shirzad

#Plot 5

setwd("C:/Users/NS/Desktop/Data_Science_Coursera/4. Exploratory Data Analysis/Final Project")

if(!exists("NEI")){
     NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
     SCC <- readRDS("Source_Classification_Code.rds")
}
if(!exists("NEISCC")){
     NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

TotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("year") +
     ylab(expression('Total PM'[2.5]*" Emissions")) +
     ggtitle('Total Emissions from motor vehicles in Baltimore from 1999 to 2008')
print(g)
dev.off()
