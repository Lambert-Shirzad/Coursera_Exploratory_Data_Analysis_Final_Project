### Exploratory Data Analysis
### Course Project 
### By Navid Lambert-Shirzad

#Plot 4

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

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

TotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(TotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
     xlab("year") +
     ylab(expression('Total PM'[2.5]*" Emissions")) +
     ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()