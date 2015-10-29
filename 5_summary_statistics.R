cat("\n ==== SUMMARY STATISTICS ====")

dir.create("Summary", showWarnings = FALSE)

cat("\n Compute means and write computed means to Summary/means.csv")
write.csv(sapply(numericData, mean, na.rm=FALSE), file="Summary/means.csv")

cat("\n Compute standard deviations and write computed standard deviations to Summary/standardDeviations.csv")
write.csv(sapply(numericData, sd, na.rm=FALSE), file="Summary/standardDeviations.csv")

cat("\n Compute correlations and write computed correlations to Summary/correlations.csv")
write.csv(cor(numericData), file="Summary/correlations.csv")

cat("\n Compute and write summary statistics to Summary/summary_statistics.csv")
write.csv(describe(numericData), file="Summary/summary_statistics.csv")

cat("\n Compute and write modes of variables")

ordinalDataModes <- character()
ordinalDataDescriptions <- character()

getOrdinalDescription <- function(value) {
  switch(value,
    "1" = "Strongly Disagree",
    "2" = "Disagree",
    "3" = "Somewhat Disagree",
    "4" = "Neutral",
    "5" = "Somewhat Agree",
    "6" = "Agree",
    "7" = "Strongly Agree")
}

for (name in ordinalVariableNames) {
  mode <- names(sort(-table(ordinalData[name])))[1]
  ordinalDataModes <- append(ordinalDataModes, mode)
  ordinalDataDescriptions <- append(ordinalDataDescriptions, getOrdinalDescription(mode))
}

write.csv(data.frame(ordinalVariableNames, ordinalDataModes, ordinalDataDescriptions), file="Summary/modes.csv", row.names=FALSE)

cat("\n")
