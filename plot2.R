## Set directory where data is downloaded and unzipped
setwd("./Coursera/Exploratory/Project2")


## load the data
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## load library dplyr

library(dplyr)

## Aggregate Data by year for Baltimore
aggBaltimoreData <- PM25 %>% filter(fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

## Creat linePlot and Export as PNG file

with(aggBaltmoreData, plot(x=year, y=Emissions, type = "l", lwd = 2,
        col = "red",
        main= "PM2.5 Emissions for Baltimore (Total)", 
        xlab = "Years", ylab= "PM2.5 Emissions by Ton"))


## Save into file
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()


