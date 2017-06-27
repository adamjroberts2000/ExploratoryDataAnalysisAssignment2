library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalCodeRows<-SCC$SCC[grepl('coal', SCC$Short.Name, ignore.case = TRUE)]
coalCodes<-SCC$SCC[coalCodeRows]
NEICoal<-NEI[NEI$SCC %in% coalCodes,]
summary<-aggregate(Emissions ~ year, NEICoal, sum)
yearLabs <- c(1999, 2002, 2005, 2008)
chartObj<-summary$Emissions
names(chartObj)<-yearLabs
barplot(chartObj, ylim=c(0,700000), xlab="Year", ylab="Total Emissions", main="Total PM2.5 Emission From Coal Sources By Year")
dev.off()


