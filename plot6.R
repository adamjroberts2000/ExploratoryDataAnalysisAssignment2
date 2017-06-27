library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

cityData<-NEI[NEI$fips=="24510"|NEI$fips=="06037",]

roadCodeRows<-SCC$SCC[SCC$Data.Category=="Onroad"]
roadCodes<-SCC$SCC[roadCodeRows]
NEIRoad<-cityData[cityData$SCC %in% roadCodes,]
summary<-aggregate(Emissions ~ year + fips, NEIRoad, sum)
summary<- transform(summary, city=ifelse(fips=="06037", "Los Angeles County", "Baltimore"))
summary$fips<-NULL

ggplot(summary, aes(x=year, y=Emissions, group=city, color=city)) +
  geom_line() +
  xlab("year") +
  ylab("Emissions") +
  ggtitle("Vehicle PM2.5 Emissions By Year And City")
dev.off()