cat("\n ==== REGRESSION ====")

if("MASS" %in% rownames(installed.packages()) == FALSE) {
  cat("\n Installing MASS")
  install.packages("MASS", repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'MASS' package")
}

require("MASS")

cat("\n Creating regression folder")
dir.create("HypothesisTesting/Regression", showWarnings = FALSE)

cat("\n Performing subjective norm regression")
SubjectiveNormLogisticRegressionResults <- polr(SubjectiveNorm ~ SubjectiveNormTime + SubjectiveNormQuality, data = ordinalData, Hess=TRUE)
subjectiveNormCoefficients <- coef(summary(SubjectiveNormLogisticRegressionResults))
subjectiveNormPValues <- pnorm(abs(subjectiveNormCoefficients[, "t value"]), lower.tail = FALSE) * 2

cat("\n Writing results to file")
sink('HypothesisTesting/Regression/SubjectiveNorm.txt')
print(summary(SubjectiveNormLogisticRegressionResults))
print(cbind(subjectiveNormCoefficients, "p value" = round(subjectiveNormPValues,10)))
sink()

cat("\n Performing attitude regression")
attitudeRegressionResults <- polr(Attitude ~ AttitudeQuality + AttitudeTime, data = ordinalData, Hess=TRUE)
attitudeCoefficients <- coef(summary(attitudeRegressionResults))
attitudePValues <- pnorm(abs(attitudeCoefficients[, "t value"]), lower.tail = FALSE) * 2

cat("\n Writing results to file")
sink('HypothesisTesting/Regression/Attitude.txt')
print(summary(attitudeRegressionResults))
print(cbind(attitudeCoefficients, "p value" = round(attitudePValues,10)))
sink()

cat("\n")
