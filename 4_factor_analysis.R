cat("\n ==== FACTOR ANALYSIS ====")

dir.create("FactorAnalysis", showWarnings = FALSE)

measures <- numericData[c("YearsExperience","AttitudeQuality1", "AttitudeQuality2", "AttitudeTime","AttitudeMaintainability","AttitudeEfficiency","AttitudeChangeability", "SubjectiveNormTime","SubjectiveNormMaintainability","SubjectiveNormQuality","SubjectiveNormChangeability","TeamTDD","UnitTestDifficulty","TDDDifficulty","TDDExperience")]

cat("\n Computing the principal component analysis")
correlationMatrix <- cor(measures)
sink('FactorAnalysis/principal_component_analysis.txt')
print(principal(correlationMatrix))
sink()

cat("\n Computing the confirmatory factor analysis analysis")
sink('FactorAnalysis/confirmatory_factor_analysis.txt')
print(omegaSem(measures))
sink()

cat("\n")
