
cat("\n ==== INSTALLING DEPENDENCIES ====")

if("car" %in% rownames(installed.packages()) == FALSE) {
  install.packages("car")
  cat("\n Installed 'car' package")
}

cat('\n Load car package')
library("car")

if("psych" %in% rownames(installed.packages()) == FALSE) {
  install.packages(c("psych","GPArotation","MASS"), repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'psych' package")
}

cat('\n Load psych package')
library("psych")

if("sem" %in% rownames(installed.packages()) == FALSE) {
  install.packages("sem", repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'sem' package")
}

cat('\n Load sem package')

cat("\n")
