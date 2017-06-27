NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmission <- c(sum(NEI$Emissions[NEI$year==1999]),
                   sum(NEI$Emissions[NEI$year==2002]),
                   sum(NEI$Emissions[NEI$year==2005]),
                   sum(NEI$Emissions[NEI$year==2008]))
yearLabs <- c(1999, 2002, 2005, 2008)
names(totalEmission)<-yearLabs
barplot(totalEmission, ylim=c(0,10000000), xlab="Year", ylab="Total Emissions", main="Total PM2.5 Emission By Year")
dev.off()
