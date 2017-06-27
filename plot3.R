library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData<-NEI[NEI$fips=="24510",]
summary<-aggregate(Emissions ~ year + type, baltimoreData, sum)
ggplot(summary, aes(x=year, y=Emissions, group=type, color=type)) +
  geom_line() +
  xlab("year") +
  ylab("Emissions") +
  ggtitle("Baltimore PM2.5 Emissions By Year And Type")
dev.off()

