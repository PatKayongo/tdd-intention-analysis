cat("\n ==== FACTOR ANALYSIS ====")

dir.create("FactorAnalysis", showWarnings = FALSE)

if("sem" %in% rownames(installed.packages()) == FALSE) {
  install.packages("sem", repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'sem' package")
}


library("sem")

measures <- numericData[c(
  "AttitudeQuality",
  "AttitudeTime",
  "AttitudeMaintainability",
  "AttitudeEfficiency",
  "SubjectiveNormTime",
  "SubjectiveNormMaintainability",
  "SubjectiveNormQuality",
  "TeamTDD",
  "TDDDifficulty",
  "TDDExperience")]

#cat("\n Computing the principal component analysis")
#correlationMatrix <- cor(measures)
#sink('FactorAnalysis/principal_component_analysis.txt')
#print(principal(correlationMatrix))
#sink()

cat("\n Computing the confirmatory factor analysis analysis")
sink('FactorAnalysis/confirmatory_factor_analysis.txt')
print(omegaSem(measures, poly=TRUE, nfactors=3))
sink()

cat("\n")
