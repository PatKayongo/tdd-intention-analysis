cat("\n ==== FACTOR ANALYSIS ====")

dir.create("FactorAnalysis", showWarnings = FALSE)

cat("\n Computing the principal component analysis")
correlationMatrix <- cor(numericData)
sink('FactorAnalysis/principal_component_analysis.txt')
print(principal(correlationMatrix))
sink()

cat("\n")
