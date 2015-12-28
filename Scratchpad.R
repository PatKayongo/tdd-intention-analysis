model.tdd <- specifyModel(text="
  A -> AttitudeQuality, NA, 1
  A -> AttitudeTime, AttitudeTimeVsAttitude, NA
  A -> AttitudeEfficiency, AttitudeEfficiencyVsAttitude, NA
  A -> AttitudeMaintainability, AttitudeMaintainabilityVsAttitude, NA
  A -> AttitudeChangeability, AttitudeChangeabilityVsAttitude, NA
  SN -> SubjectiveNormQuality, NA, 1
  SN -> SubjectiveNormTime, SubjectiveNormTimeVsSubjectiveNorm, NA
  SN -> SubjectiveNormMaintainability, SubjectiveNormMaintainabilityVsSN, NA
  SN -> SubjectiveNormChangeability, SNChangeabilityVsSN, NA
  PBC -> TDDDifficulty, NA, 1
  PBC -> UnitTestDifficulty, UnitTestDifficultyVsPBC, 1
  I -> A, int1, NA
  I -> SN, int2, NA
  I -> PBC, int3, NA
  I <-> I, int, NA
  AttitudeQuality <-> AttitudeQuality, attQual, NA
  AttitudeTime <-> AttitudeTime, attTime, NA
  AttitudeEfficiency <-> AttitudeEfficiency, atteff, NA
  SubjectiveNormQuality <-> SubjectiveNormQuality, snqual, NA
  SubjectiveNormTime <-> SubjectiveNormTime, sntime, NA
  TDDDifficulty <-> TDDDifficulty, tdddiff, NA
  UnitTestDifficulty <-> UnitTestDifficulty, utdiff, NA")


    model.tdd <- cfa(text="
      attitude: AttitudeQuality, AttitudeTime, AttitudeEfficiency, AttitudeMaintainability, AttitudeChangeability
      subjectiveNorm: SubjectiveNormQuality, SubjectiveNormTime, SubjectiveNormChangeability, SubjectiveNormMaintainability
      pbc: UnitTestDifficulty, TDDDifficulty")

      if (require(polycor)){

        hcor <- function(data) hetcor(data, std.err=FALSE)$correlations

        measures <- ordinalData[c(
          "AttitudeQuality",
          "AttitudeTime",
          "AttitudeEfficiency",
          "AttitudeMaintainability",
          "AttitudeChangeability",
          "SubjectiveNormTime",
          "SubjectiveNormQuality",
          "SubjectiveNormMaintainability",
          "SubjectiveNormChangeability",
          "UnitTestDifficulty",
          "TDDDifficulty")]

          model.tdd <- specifyModel(text="
            Attitude -> AttitudeQuality, NA, 1
            Attitude -> AttitudeTime, AttitudeTimeVsAttitude, NA
            Attitude -> AttitudeEfficiency, AttitudeEfficiencyVsAttitude, NA
            Attitude -> AttitudeMaintainability, AttitudeMaintainabilityVsAttitude, NA
            Attitude -> AttitudeChangeability, AttitudeChangeabilityVsAttitude, NA
            Attitude <-> Attitude, att, NA
            SubjectiveNorm -> SubjectiveNormQuality, NA, 1
            SubjectiveNorm -> SubjectiveNormTime, SubjectiveNormTimeVsSubjectiveNorm, NA
            SubjectiveNorm -> SubjectiveNormMaintainability, SubjectiveNormMaintainabilityVsSN, NA
            SubjectiveNorm -> SubjectiveNormChangeability, SNChangeabilityVsSN, NA
            SubjectiveNorm <-> SubjectiveNorm, subj, NA
            PBC -> TDDDifficulty, NA, 1
            PBC -> UnitTestDifficulty, UnitTestDifficultyVsPBC, 1
            Intention -> Attitude, int1, NA
            Intention -> SubjectiveNorm, int2, NA
            Intention -> PBC, int3, NA
            Intention <-> Intention, int, NA
            AttitudeQuality <-> AttitudeQuality, attQual, NA
            AttitudeTime <-> AttitudeTime, attTime, NA
            AttitudeEfficiency <-> AttitudeEfficiency, atteff, NA
            SubjectiveNormQuality <-> SubjectiveNormQuality, snqual, NA
            SubjectiveNormTime <-> SubjectiveNormTime, sntime, NA
            TDDDifficulty <-> TDDDifficulty, tdddiff, NA
            UnitTestDifficulty <-> UnitTestDifficulty, utdiff, NA")

        R.cnes <- hcor(measures)
        sem.cnes <- sem(model.tdd, R.cnes, N=779)

        pathDiagram(sem.cnes, file="workman",  edge.labels="both", output.type="graphics", digits=3,  graphics.fmt = "pdf")

        sink('FactorAnalysis/whatwhat.txt')
        print(summary(sem.cnes))
        sink()
      }
