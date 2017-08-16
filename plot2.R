source("Load Data.R")

#filter the data for the baltimore city
  baltimoredata <- subset(nei_df, fips == "24510")

#total emission for the baltimore city.
  aggregate(Emissions~year, baltimoredata, sum) -> plot2_tot

#Have total emissions from PM2.5 decreased in the Baltimore City,
#Maryland (fips == "24510") from 1999 to 2008? 

  png("plot2.png")

  barplot(height=plot2_tot$Emissions, 
        names.arg = plot2_tot$year, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in Baltimore City'))

  dev.off()

