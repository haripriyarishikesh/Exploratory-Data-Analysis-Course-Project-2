source("Load Data.R")
library(dplyr)

#sum the total emission b year.
total_emission <- aggregate(Emissions ~ year, nei_df, sum)

#Have total emissions from PM2.5 decreased in the United States from
#1999 to 2008? Using the base plotting system, make a plot showing
#the total PM2.5 emission from all sources for each of the years 
#1999, 2002, 2005, and 2008.

png('plot1.png')
barplot(height=total_emission$Emissions, 
          names.arg = total_emission$year, 
          xlab="years", 
          ylab=expression('total PM'[2.5]*' emission'),
          main=expression('Total PM'[2.5]*' emissions from 1999 to 2008'))
dev.off()


