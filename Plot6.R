### Exploratory Data Analysis
### Course Project 
### By Navid Lambert-Shirzad

#Plot 6

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

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
     xlab("year") +
     ylab(expression('Total PM'[2.5]*" Emissions")) +
     ggtitle('Total Emissions from motor vehiclesin Baltimore vs Los Angeles (1999-2008)')
print(g)
dev.off()