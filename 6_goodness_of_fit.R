cat("\n ==== GOODNESS OF FIT ====")

dir.create("ChiSquareTests", showWarnings = FALSE)

combineTableOrdinalColumns <- function(tableData) {
  combinedColumns <- cbind(
    tableData[,"1"] + tableData[,"2"] + tableData[,"3"],
    tableData[,"4"],
    tableData[,"5"] + tableData[,"6"] + tableData[,"7"])

  return(combinedColumns)
}

combineTableOrdinalRows <- function(tableData) {
  combinedRows <- contingencyTable2 <- rbind(
    tableData["1",] + tableData["2",] + tableData["3",],
    tableData["4",],
    tableData["5",] + tableData["6",] + tableData["7",])
}

ordinalChiSquareTest <- function(variable1, variable2, fileName) {
  tableData <- table(variable1, variable2)
  contingencyTable1 <- combineTableOrdinalColumns(tableData)
  contingencyTable2 <- combineTableOrdinalRows(contingencyTable1)

  fullFileName <- paste('ChiSquareTests/', fileName, '.txt', sep="")
  cat(fullFileName);
  write.csv(contingencyTable2, file=paste('ChiSquareTests/', fileName, '.csv', sep=""))

  cat(fileName,
    capture.output(chisq.test(contingencyTable2)),
    file=fullFileName)
}

ordinalAndBinaryChiSquareTest <- function(oridinalMeasure, binaryMeasure, fileName) {
  tableData <- table(binaryMeasure, oridinalMeasure)
  contingencyTable <- combineTableOrdinalColumns(tableData)

  fullFileName <- paste('ChiSquareTests/', fileName, '.txt', sep="")
  cat(fullFileName)
  write.csv(contingencyTable, file=paste('ChiSquareTests/', fileName, '.csv', sep=""))

  cat(fileName,
    capture.output(chisq.test(contingencyTable)),
    file=fullFileName)
}

ordinalChiSquareTest(ordinalData$AttitudeTime, ordinalData$Attitude, 'AttitudeTimeVsAttitude')
ordinalChiSquareTest(ordinalData$AttitudeQuality, ordinalData$Attitude, 'AttitudeQualityVsAttitude')
ordinalChiSquareTest(ordinalData$AttitudeEfficiency, ordinalData$Attitude, 'AttitudeEfficiencyVsAttitude')
ordinalAndBinaryChiSquareTest(ordinalData$Attitude, numericData$Intention, 'AttitudeVsIntention')

ordinalChiSquareTest(ordinalData$SubjectiveNormTime, ordinalData$SubjectiveNorm, 'SubjectiveNormTimeVsSubjectiveNorm')
ordinalChiSquareTest(ordinalData$SubjectiveNormQuality, ordinalData$SubjectiveNorm, 'SubjectiveNormQualityVsSubjectiveNorm')
ordinalAndBinaryChiSquareTest(ordinalData$SubjectiveNorm, numericData$Intention, 'SubjectiveNormVsIntention')

ordinalAndBinaryChiSquareTest(ordinalData$UnitTestDifficulty, numericData$Intention, 'UnitTestDifficultyVsIntention')
ordinalAndBinaryChiSquareTest(ordinalData$TDDDifficulty, numericData$Intention, 'TDDDifficultyVsIntention')


cat("\n")
