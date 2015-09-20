
# LOAD DATA IN VARIABLE results

results <- read.csv("data.csv", sep=",")

# RECODING OF VARIABLES

# create variable for intention
results$Intention <- NA
results$Intention  <- with(results, ifelse(PracticeTDD=='Yes', 1, ifelse(WantTDD== 'Yes', 1, 0)))

# load car package to use recode function
if("car" %in% rownames(installed.packages()) == FALSE) {
  install.packages("car")
}

library("car")

# record attitude time variable
results$AttitudeTimeOriginal <- results$AttitudeTime
results$AttitudeTime <- recode(results$AttitudeTimeOriginal, "1=7;2=6;3=5;4=4;5=3;6=2;7=1")

#recode subjective norm time variable
results$SubjectiveNormTimeOriginal <- results$SubjectiveNormTime
results$SubjectiveNormTime <- recode(results$SubjectiveNormTimeOriginal, "1=7;2=6;3=5;4=4;5=3;6=2;7=1")

results$SubjectiveNorm <- NA
results$SubjectiveNorm <- with(results, (SubjectiveNorm1 + SubjectiveNorm2)/2)

results$AttitudeQuality <- NA
results$AttitudeQuality <- with(results, (AttitudeQuality1 + AttitudeQuality2)/2)

# OUTPUT RESULTS TO A FILE

write.csv(results, file = "results.csv")
