NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData<-NEI[NEI$fips=="24510",]
totalEmission <- c(sum(baltimoreData$Emissions[baltimoreData$year==1999]),
                   sum(baltimoreData$Emissions[baltimoreData$year==2002]),
                   sum(baltimoreData$Emissions[baltimoreData$year==2005]),
                   sum(baltimoreData$Emissions[baltimoreData$year==2008]))
yearLabs <- c(1999, 2002, 2005, 2008)
names(totalEmission)<-yearLabs
barplot(totalEmission, ylim=c(0,5000), xlab="Year", ylab="Total Emissions", main="Baltimore PM2.5 Emissions By Year")
dev.off()