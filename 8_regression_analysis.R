cat("\n ==== REGRESSION ====")

if("MASS" %in% rownames(installed.packages()) == FALSE) {
  cat("\n Installing MASS")
  install.packages("MASS", repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'MASS' package")
}

require("MASS")

cat("\n Creating regression folder")
dir.create("Regression", showWarnings = FALSE)

cat("\n Performing regression")
logisticRegressionResults <- polr(SubjectiveNorm ~ SubjectiveNormTime + SubjectiveNormQuality, data = ordinalData, Hess=TRUE)
coefficients <- coef(summary(logisticRegressionResults))
p <- pnorm(abs(coefficients[, "t value"]), lower.tail = FALSE) * 2

cat("\n Writing results to file")
sink('Regression/SubjectiveNorm.txt')
print(summary(logisticRegressionResults))
sink()

sink('Regression/SubjectiveNormPValue.txt')
print(cbind(coefficients, "p value" = round(p,10)))
sink()

cat("\n")
