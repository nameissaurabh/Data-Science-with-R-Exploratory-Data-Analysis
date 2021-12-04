#Compare emissions from motor vehicle sources in Baltimore City with emissions from
#motor vehicle sources in Los Angeles County, California 
#(\color{red}{\verb|fips == "06037"|}fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

scc_veh <- SCC[grep("[Vv]eh",SCC$Short.Name),]
balt_cal_veh <- NEI %>% filter(fips %in% c("24510","06037") & NEI$SCC %in% scc_veh$SCC)%>%
        group_by(year,fips) %>% summarize(total_emission=sum(Emissions))
png("plot6.png",height=480,width=480)
ggplot(data=balt_cal_veh,mapping=aes(x=year,y=total_emission))+
        geom_point(shape=1,size=5,color="orange")+
        facet_grid(fips~.)
dev.off()
