source("Load Data.R")

#filter the data for the baltimore city
  baltimoredata <- subset(neidf, fips == "24510")

#Total emission depending on the respective type.
  aggregate(Emissions~(year+type), baltimoredata, sum) ->tot_plot3

#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of
#these four sources have seen decreases in emissions from 
#1999-2008 for Baltimore City? Which have seen increases in 
#emissions from 1999-2008? Use the ggplot2 plotting system to 

  png("plot3.png")
  
  g <- ggplot(data = tot_plot3, aes(x = factor(year), y = Emissions, fill = type ))
  g + geom_bar(stat = "identity") +
  facet_wrap(~type) +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
   ggtitle(expression("Total PM"[2.5]*"  Emissions in Baltimore with respect to type"))
  
  dev.off()  
  
  
  
  
