#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyverse)
total_ems <- NEI %>% group_by(year)%>% summarize(total_emission = sum(Emissions,na.rm=T))
total_ems$total_emission<-format(total_ems$total_emission,scientific = FALSE)
png("plot1.png",width=480,height=480)
with(total_ems,plot(year,total_emission,xlab="year",
                    ylab="Emissions over that year [In Tons]",pch=1,cex=2,col="green"))
dev.off()
