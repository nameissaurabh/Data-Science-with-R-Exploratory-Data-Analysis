#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
baltimore <- NEI %>% filter(fips == "24510")%>% group_by(year) %>%
        summarize(total_emission=sum(Emissions))
png("plot2.png",width=480,height=480)
with(baltimore,plot(year,total_emission,pch=1,cex=2,col="red",
                    xlab="Year",ylab="Total emission over year",
                    main="PM2.5 Emission in Baltimore city"))
dev.off()
