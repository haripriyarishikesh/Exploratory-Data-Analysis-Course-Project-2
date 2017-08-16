source("Load Data.R")

#filtering the baltimore data have emissions from motor vehicle sources
  plot5_df <- subset(baltimoredata,type == "ON-ROAD")
  tot_plot5 <- aggregate(Emissions ~ year, plot5_df, sum)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

  png("plot5.png")
  g <- ggplot(tot_plot5, aes(factor(year), Emissions))
  
  g + geom_bar(stat="identity") +
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) \n in Baltimore City,from 1999 to 2008')
  
  dev.off()
  
 
                       