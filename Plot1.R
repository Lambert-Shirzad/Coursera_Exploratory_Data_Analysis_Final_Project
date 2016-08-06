### Exploratory Data Analysis
### Course Project 
### By Navid Lambert-Shirzad

#Plot 1

setwd("C:/Users/NS/Desktop/Data_Science_Coursera/4. Exploratory Data Analysis/Final Project")

if(!exists("NEI")){
     NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
     SCC <- readRDS("Source_Classification_Code.rds")
}
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

TotalByYear <- with(NEI, aggregate(Emissions, by = list(year), sum))

png('plot1.png')
plot(TotalByYear$Group.1, TotalByYear$x, type = "o", xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()