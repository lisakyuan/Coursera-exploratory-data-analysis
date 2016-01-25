## Set directory where data is downloaded and unzipped
setwd("./Coursera/Exploratory/Project2")


## load the data
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## load library dplyr and ggplot2

library(dplyr)
library(ggplot2)

## Get Data for Baltimore

BalPM25 <- PM25 %>% filter(fips == "24510") 

## Aggregate data by type

AggBalPM25 <- BalPM25 %>% group_by(type, year) %>% summarise(Emissions = sum(Emissions))

## Creat linePlot and Export as PNG file

qplot(year, Emissions, data=AggBalPM25, geom = "line", color = type, lwd = 2) + ggtitle(expression("Baltimore"~ 
                    PM[2.5] ~ "Emissions by Source Type by Year")) + xlab("Year") + ylab(expression("Total"
                    ~PM[2.5] ~"Emissions (Tons)"))


## Save into file
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()


