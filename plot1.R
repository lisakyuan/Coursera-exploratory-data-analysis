## Set directory where data is downloaded and unzipped
setwd("./Coursera/Exploratory/Project2")


## load the data
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## Aggregate Data by year
aggData <- aggregate(Emissions ~ year, data=PM25, FUN=sum)

## Creat BarPlot and Export as PNG file

barplot((aggData$Emissions)/10^6, names.arg=aggData$year, 
        col = "blue",  
        main= "PM2.5 Emissions for all US Sources 1999 - 2008", 
        xlab = "Year", ylab= "PM2.5 Emissions (10^6 Tons)")


## Save into file
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()


