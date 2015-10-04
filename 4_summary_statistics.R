cat("\n ==== SUMMARY STATISTICS ====")

dir.create("Summary", showWarnings = FALSE)

numericVariableNames <- c("YearsExperience", "Attitude","AttitudeTime","AttitudeMaintainability","AttitudeEfficiency","AttitudeChangeability","SubjectiveNormTime","SubjectiveNormMaintainability","SubjectiveNormQuality","SubjectiveNormChangeability","TeamTDD","UnitTestDifficulty","TDDDifficulty","TDDExperience","Intention","SubjectiveNorm","AttitudeQuality")
numericData <- results[numericVariableNames]

cat("\n Compute means")
means <- sapply(numericData, mean, na.rm=FALSE)
cat("\n Write computed means to Summary/means.csv")
write.csv(means, file="Summary/means.csv")
rm(means)

cat("\n Compute standard deviations")
standardDeviations <- sapply(numericData, sd, na.rm=FALSE)
cat("\n Write computed standard deviations to Summary/standardDeviations.csv")
write.csv(standardDeviations, file="Summary/standardDeviations.csv")
rm(standardDeviations)

cat("\n compute correlations")
correlations <- cor(numericData)
cat("\n Write computed correlations to Summary/correlations.csv")
write.csv(correlations, file="Summary/correlations.csv")
rm(correlations)

cat("\n")
