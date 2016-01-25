## Set directory where data is downloaded and unzipped
setwd("./Coursera/Exploratory/Project2")


## load the data
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## load library dplyr and ggplot2

library(dplyr)
library(ggplot2)

## Get data for Baltimore with Motor Vehicle Emissions

BalPM25 <- subset(PM25, fips == "24510")
SCC.vehicles <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE), ]
vehiclesSCC <- SCC.vehicles$SCC
BalvehiclesPM25 <- BalPM25[BalPM25$SCC %in% vehiclesSCC, ]



## Creat BarPlot and Export as PNG file

ggplot(data=BalvehiclesPM25, aes(x=factor(year), y=Emissions)) + 
  geom_bar(stat="identity", fill="gray", width= 0.75) + 
  theme_bw() + theme(plot.title = element_text(size=rel(1), color = "blue")) +
  ggtitle (expression("PM"[2.5]*" Motor Vehicle Emissions Baltimore City")) +
  xlab("Year") + 
  ylab("Total Emissions (Tons)")


## Save into file
dev.copy(png, file = "plot5.png", height=480, width=480)

dev.off()


