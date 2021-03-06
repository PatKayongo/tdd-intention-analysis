
cat("\n ==== INSTALLING DEPENDENCIES ====")

if("car" %in% rownames(installed.packages()) == FALSE) {
  install.packages("car")
  cat("\n Installed 'car' package")
}

cat('\n Load car package')
library("car")

if("polycor" %in% rownames(installed.packages()) == FALSE) {
  install.packages("polycor", repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'polycor' package")
}

library(plyr)

if("psych" %in% rownames(installed.packages()) == FALSE) {
  install.packages(c("psych","GPArotation","MASS"), repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'psych' package")
}

cat('\n Load psych package')
library("psych")

cat("\n")
