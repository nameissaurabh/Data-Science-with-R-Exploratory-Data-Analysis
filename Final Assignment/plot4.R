#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999-2008?
scc_coal <- SCC[grep("[Cc]oal",SCC$Short.Name),]
tmp <- NEI %>% inner_join(scc_coal,by="SCC") %>% group_by(year) %>% summarize(total_emission=sum(Emissions))
png("plot4.png",height=480,width=480)
ggplot(data=tmp)+geom_point(mapping=aes(x=year,y=total_emission),color="red",shape=1,size=5)
dev.off()
