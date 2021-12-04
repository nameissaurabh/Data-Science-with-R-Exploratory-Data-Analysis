#Of the four types of sources indicated by the \color{red}{\verb|type|}
#type (point, nonpoint, onroad, nonroad) variable, which of these four 
#sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
baltimore <- subset(NEI, fips == "24510") %>% group_by(year,type) %>%
        summarize(total_emissions=sum(Emissions))
png("plot3.png",width=480,height=480)
ggplot(data=baltimore)+
        geom_point(mapping = aes(x=year,y=total_emissions))+
        facet_grid(type~.)
dev.off()
