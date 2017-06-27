NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData<-NEI[NEI$fips=="24510",]

roadCodeRows<-SCC$SCC[SCC$Data.Category=="Onroad"]
roadCodes<-SCC$SCC[roadCodeRows]
NEIRoad<-baltimoreData[baltimoreData$SCC %in% roadCodes,]
summary<-aggregate(Emissions ~ year, NEIRoad, sum)
yearLabs <- c(1999, 2002, 2005, 2008)
chartObj<-summary$Emissions
names(chartObj)<-yearLabs
barplot(chartObj, ylim=c(0,500), xlab="Year", ylab="Total Emissions", main="Total PM2.5 Emission From Road Sources By Year")
dev.off()