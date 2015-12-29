cat("\n ==== CONTINGENCY TABLES ====")

dir.create("HypothesisTesting/ContingencyTables", showWarnings = FALSE)

attach(ordinalData)
write.csv(table(Attitude, AttitudeQuality), 'HypothesisTesting/ContingencyTables/AttitudeQualityVsAttitude.csv')
write.csv(table(Attitude, AttitudeTime), 'HypothesisTesting/ContingencyTables/AttitudeTimeVsAttitude.csv')
write.csv(table(Attitude, AttitudeEfficiency), 'HypothesisTesting/ContingencyTables/AttitudeEfficiencyVsAttitude.csv')
write.csv(table(Attitude, AttitudeMaintainability), 'HypothesisTesting/ContingencyTables/AttitudeMaintainabilityVsAttitude.csv')

cat("\n")
