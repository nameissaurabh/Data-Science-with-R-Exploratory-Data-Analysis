#How have emissions from motor vehicle sources changed from 1999-2008 
#in Baltimore City?
scc_veh <- SCC[grep("[Vv]eh",SCC$Short.Name),]
baltimore_veh <- NEI %>% filter(fips=="24510" & NEI$SCC %in% scc_veh$SCC)%>%
        group_by(year) %>% summarize(total_emission=sum(Emissions))
png("plot5.png",height=480,width=480)
ggplot(data=baltimore_veh,mapping=aes(x=year,y=total_emission))+
        geom_point(shape=1,size=5,color="green")
dev.off()
