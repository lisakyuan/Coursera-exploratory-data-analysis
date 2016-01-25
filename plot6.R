## Set directory where data is downloaded and unzipped
setwd("./Coursera/Exploratory/Project2")


## load the data
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## load library data.table and ggplot2

library(ggplot2)
library(data.table)

## Get data for Baltimore and Los Angeles with Motor Vehicle Emissions

targetPM25 <- subset(PM25, PM25$fips == "24510"| PM25$fips == "06037")


## Get SCC codes for motor vehicle emissions

SCC.vehicles <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE), ]
vehiclesSCC <- SCC.vehicles$SCC

## Select Baltimore and LA motor vehicle related records
targetvehiclesPM25 <- targetPM25[targetPM25$SCC %in% vehiclesSCC, ]

## Change the fips value to city names

setnames(targetvehiclesPM25, "fips" , "City")
targetvehiclesPM25$City[targetvehiclesPM25$City == "24510"] <- "Baltimore"
targetvehiclesPM25$City[targetvehiclesPM25$City == "06037"] <- "Los Angeles"


## Creat BarPlot and Export as PNG file

ggplot(data=targetvehiclesPM25, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat = "identity", fill = "darkgoldenrod4", width= 0.75) + 
  facet_grid(.~City, scales = "free", space = "free") +
  theme(plot.title = element_text(size=rel(1), color = "darkblue")) +
  ggtitle (expression("PM"[2.5]*" Motor Vehicle Emissions - Baltimore City Vs. LA County")) +
  xlab("Year") + 
  ylab("Emissions (Tons)")


## Save into file
dev.copy(png, file = "plot6.png", height=480, width=480)
dev.off()


