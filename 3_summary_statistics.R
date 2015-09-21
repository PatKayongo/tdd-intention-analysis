
dir.create("Summary", showWarnings = FALSE)

numericVariableNames <- c("YearsExperience", "Attitude","AttitudeTime","AttitudeMaintainability","AttitudeEfficiency","AttitudeChangeability","SubjectiveNormTime","SubjectiveNormMaintainability","SubjectiveNormQuality","SubjectiveNormChangeability","TeamTDD","UnitTestDifficulty","TDDDifficulty","TDDExperience","Intention","SubjectiveNorm","AttitudeQuality")
numericData <- results[numericVariableNames]

means <- sapply(numericData, mean, na.rm=FALSE)
write.csv(means, file="Summary/means.csv")
rm(means)

standardDeviations <- sapply(numericData, sd, na.rm=FALSE)
write.csv(standardDeviations, file="Summary/standardDeviations.csv")
rm(standardDeviations)

correlations <- cor(numericData)
write.csv(correlations, file="Summary/correlations.csv")
rm(correlations)
