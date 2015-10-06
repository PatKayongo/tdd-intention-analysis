cat("\n ==== RELIABILITY AND VALIDITY ====")

dir.create("Reliability", showWarnings = FALSE)

cat("\n Compute Kaiser, Meyer, Olkin Measure of Sampling Adequacy and write to Reliability/samping_adequacy.txt")
sink('Reliability/samping_adequacy.txt')
print(KMO(numericData))
sink()

cat("\n Compute ordinal alpha for Attitude Quality and write to Reliability/attitude_quality_ordinal_alpha.txt")
attitudeQualityData <- data.frame(numericData$AttitudeQuality1, numericData$AttitudeQuality2)
attitudePolychoricCorrelationMatrix <- polychoric(attitudeQualityData)
sink('Reliability/attitude_quality_ordinal_alpha.txt')
print(alpha(attitudePolychoricCorrelationMatrix$rho))
sink()

cat("\n Compute ordinal alpha for Subjective Norms and write to Reliability/subjective_norm_ordinal_alpha.txt")
subjectiveNormQualityData <- data.frame(numericData$SubjectiveNorm1, numericData$SubjectiveNorm2)
subjectiveNormPolychoricCorrelationMatrix <- polychoric(subjectiveNormQualityData)
sink('Reliability/subjective_norm_ordinal_alpha.txt')
print(alpha(subjectiveNormPolychoricCorrelationMatrix$rho))
sink()

cat("\n")
