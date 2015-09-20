
dir.create("Summary")

means <- sapply(results, mean, na.rm=FALSE)
write.csv(means, file="Summary/means.csv")

standardDeviations <- sapply(results, sd, na.rm=FALSE)
write.csv(standardDeviations, file="Summary/standardDeviations.csv")

numericVariableNames <- c("YearsExperience", "Attitude","AttitudeTime","AttitudeMaintainability","AttitudeEfficiency","AttitudeChangeability","SubjectiveNormTime","SubjectiveNormMaintainability","SubjectiveNormQuality","SubjectiveNormChangeability","TeamTDD","UnitTestDifficulty","TDDDifficulty","TDDExperience","Intention","SubjectiveNorm","AttitudeQuality")
numericData <- results[numericVariableNames]
correlations <- cor(numericData)
write.csv(correlations, file="Summary/correlations.csv")
