cat("\n ==== DESCRIPTIVE STATISTICS ====")

cat("\n Loading data file")
geosessions <- read.csv("GeoSessions.csv", sep=",")
cat("\n Data file loaded")


cat("\n Prepare data for geo sessions")
attach(geosessions)
sortedGeosessions <- geosessions[order(-Sessions),]
detach(geosessions)

topTenGeosessions <- head(sortedGeosessions, 10)

cat("\n Create GeographyOfResults.jpg file")
labelNames <- paste(topTenGeosessions$Country, "\n", topTenGeosessions$Sessions, sep="")
jpeg(filename="GeographyOfResults.jpg",width=640,height=640)
pie(topTenGeosessions$Sessions, labels = labelNames, col = rainbow(nrow(topTenGeosessions)))
dev.off()

cat("\n")
