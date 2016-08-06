### Exploratory Data Analysis
### Course Project 
### By Navid Lambert-Shirzad

#Plot 2

setwd("C:/Users/NS/Desktop/Data_Science_Coursera/4. Exploratory Data Analysis/Final Project")

if(!exists("NEI")){
     NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
     SCC <- readRDS("Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

TotalBaltimoreYear <- with(subsetNEI, aggregate(Emissions, by = list(year), sum))

png('plot2.png')
plot(TotalBaltimoreYear$Group.1, TotalBaltimoreYear$x, type = "o", xlab="years", 
     ylab=expression('total PM'[2.5]*' emission'),
     main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()