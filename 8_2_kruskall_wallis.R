cat("\n ==== KRUSKALL WALLIS ====")

dir.create("HypothesisTesting/KruskallWallis", showWarnings = FALSE)


sink('HypothesisTesting/KruskallWallis/Attitude.txt')
print(kruskal.test(Attitude ~ AttitudeQuality, data=ordinalData))
print(kruskal.test(Attitude ~ AttitudeTime, data=ordinalData))
print(kruskal.test(Attitude ~ AttitudeEfficiency, data=ordinalData))
print(kruskal.test(Attitude ~ AttitudeChangeability, data=ordinalData))
print(kruskal.test(Attitude ~ AttitudeMaintainability, data=ordinalData))
sink()

sink('HypothesisTesting/KruskallWallis/SubjectiveNorm.txt')
print(kruskal.test(SubjectiveNorm ~ SubjectiveNormTime, data=ordinalData))
print(kruskal.test(SubjectiveNorm ~ SubjectiveNormQuality, data=ordinalData))
print(kruskal.test(SubjectiveNorm ~ SubjectiveNormChangeability, data=ordinalData))
print(kruskal.test(SubjectiveNorm ~ SubjectiveNormMaintainability, data=ordinalData))
sink()

sink('HypothesisTesting/KruskallWallis/Intention.txt')
print(kruskal.test(Intention ~ Attitude, data=numericData))
print(kruskal.test(Intention ~ SubjectiveNorm, data=numericData))
print(kruskal.test(Intention ~ TDDExperience, data=numericData))
print(kruskal.test(Intention ~ TDDDifficulty, data=numericData))
sink()
