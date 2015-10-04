
cat("\n ==== INSTALLING DEPENDENCIES ====")

if("car" %in% rownames(installed.packages()) == FALSE) {
  install.packages("car")
  cat("\n Installed 'car' package")
}

if("psych" %in% rownames(installed.packages()) == FALSE) {
  install.packages(c("psych","GPArotation","MASS"), repos = "https://cran.uni-muenster.de")
  cat("\n Installed 'psych' package")
}

cat("\n")
