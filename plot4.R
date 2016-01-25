## Set directory where data is downloaded and unzipped
setwd("./Coursera/Exploratory/Project2")


## load the data
PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## load library dplyr and ggplot2

library(dplyr)
library(ggplot2)

## Extract SCC codes for coal combustion related sources

SCC.coal <- SCC[grep("coal", SCC$Short.Name, ignore.case=TRUE), ]
coalSCC <- SCC.coal$SCC

## Select coal related records
coalPM25 <- PM25[PM25$SCC %in% coalSCC, ]



## Creat BarPlot and Export as PNG file

ggplot(data=coalPM25, aes(x=factor(year), y=Emissions/1000)) + 
  geom_bar(stat="identity", fill="orange", width= 0.5) + 
  theme_bw() + theme(plot.title = element_text(size=rel(1), color = "blue")) +
  ggtitle (expression("PM"[2.5]*" Coal Combustion Source Emissions - US 1999-2008")) +
  xlab("Year") + 
  ylab("Emissions (1000 Tons)")


## Save into file
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()


