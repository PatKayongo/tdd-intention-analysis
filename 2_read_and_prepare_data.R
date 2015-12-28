cat("\n ==== READ AND PREPARE DATA ====")

# LOAD DATA IN VARIABLE results

cat("\n Loading data file")
results <- read.csv("data.csv", sep=",")
cat("\n Data file loaded")

# RECODING OF VARIABLES

cat("\n Create variable for intention")
results$Intention <- NA
results$Intention  <- with(results, ifelse(PracticeTDD=='Yes', 1, ifelse(WantTDD== 'Yes', 1, 0)))

# load car package to use recode function


cat("\n Recode attitude time variable")
results$AttitudeTimeOriginal <- results$AttitudeTime
results$AttitudeTime <- recode(results$AttitudeTimeOriginal, "1=7;2=6;3=5;4=4;5=3;6=2;7=1")

cat("\n Recode subjective norm time variable")
results$SubjectiveNormTimeOriginal <- results$SubjectiveNormTime
results$SubjectiveNormTime <- recode(results$SubjectiveNormTimeOriginal, "1=7;2=6;3=5;4=4;5=3;6=2;7=1")

cat("\n Recode unit test difficulty variable")
results$UnitTestDifficultyOriginal <- results$UnitTestDifficulty
results$UnitTestDifficulty <- recode(results$UnitTestDifficultyOriginal, "1=7;2=6;3=5;4=4;5=3;6=2;7=1")

cat("\n Recode TDD difficulty variable")
results$TDDDifficultyOriginal <- results$TDDDifficulty
results$TDDDifficulty <- recode(results$TDDDifficultyOriginal, "1=7;2=6;3=5;4=4;5=3;6=2;7=1")

cat("\n Combine SubjectiveNorm variables into one")
results$SubjectiveNorm <- NA
results$SubjectiveNorm <- with(results, ifelse(OrganizationVsSelf=='Organization', SubjectiveNorm1, SubjectiveNorm2))

cat("\n Combine Attitude-Quality variables into one")
results$AttitudeQuality <- NA
results$AttitudeQuality <- results$AttitudeQuality1

# OUTPUT RESULTS TO A FILE

cat("\n Output the results to results.csv")
write.csv(results, file = "results.csv")

numericVariableNames <- c(
  "YearsExperience",
  "Attitude",
  "AttitudeQuality",
  "AttitudeQuality1",
  "AttitudeQuality2",
  "AttitudeTime",
  "AttitudeMaintainability",
  "AttitudeEfficiency",
  "AttitudeChangeability",
  "SubjectiveNorm",
  "SubjectiveNorm1",
  "SubjectiveNorm2",
  "SubjectiveNormTime",
  "SubjectiveNormMaintainability",
  "SubjectiveNormQuality",
  "SubjectiveNormChangeability",
  "TeamTDD","UnitTestDifficulty",
  "TDDDifficulty",
  "TDDExperience",
  "Intention")
numericData <- results[numericVariableNames]

ordinalVariableNames <- c(
  "Attitude",
  "AttitudeQuality",
  "AttitudeTime" ,
  "AttitudeMaintainability",
  "AttitudeEfficiency",
  "AttitudeChangeability",
  "SubjectiveNorm",
  "SubjectiveNormTime",
  "SubjectiveNormMaintainability",
  "SubjectiveNormQuality",
  "SubjectiveNormChangeability",
  "TeamTDD",
  "UnitTestDifficulty",
  "TDDDifficulty",
  "TDDExperience")
ordinalData <- results[ordinalVariableNames]

condensedOrdinalData <- ordinalData

for (i in names(condensedOrdinalData)) {
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 1] = 1
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 2] = 1
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 3] = 1
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 4] = 2
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 5] = 3
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 6] = 3
    condensedOrdinalData[[i]][condensedOrdinalData[[i]] == 7] = 3
}

for (i in names(ordinalData)) {
  ordinalData[[i]] <- as.factor(ordinalData[[i]])
}

cat("\n")
