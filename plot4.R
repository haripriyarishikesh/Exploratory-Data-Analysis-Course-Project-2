source("Laod Data.R")

#Filter the SCC for Coal from the scc data.
  sccdf[grep("Coal", sccdf$Short.Name),] -> selectedrows

#Subset the data with filtered SCC data.
  subset(nei_df, SCC %in% selectedrows$SCC) -> coal_data 
  aggregate(Emissions~year, coal_data, sum) -> tot_plot4
  
#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999-2008?
  
  
  png("plot4.png")
  g <- ggplot(data = tot_plot4, aes(x = factor(year), y = Emissions))
  
  g + geom_bar(stat="identity",width=0.75)+
      theme_bw() + 
      theme(plot.title = element_text(hjust = 0.5))+
      labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
      ggtitle(expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
  
  dev.off() 