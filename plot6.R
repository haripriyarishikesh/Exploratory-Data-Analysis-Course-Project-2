source("Load data.R")

#Filter the data ith respect to baltimore and Los Angeles.
  plot6_subdata <- subset(neidf, fips %in% c("24510","06037") & type == "ON-ROAD")

#sum the total emission for the respective cities.
  aggregate(Emissions~(year+fips), plot6_subdata, sum) ->tot_plot6
  colnames(tot_plot6)[2] <- "City"
  tot_plot6$City[tot_plot6$City == "06037"] <- "Los Angeles"
  tot_plot6$City[tot_plot6$City == "24510"] <- "Baltimore"
  
#Which city has seen greater changes over time in motor vehicle emissions?
  
  png("plot6.png")
  g <- ggplot(data = tot_plot6, aes(x = factor(year), y = Emissions, fill = City ))

  g + geom_bar(stat = "identity") + facet_wrap(~City) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5))+
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) \n in Baltimore City vs Los Angeles from 1999-2008')
  
  dev.off()
  

