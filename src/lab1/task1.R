try_get_num <- function(str) {
  num <- tryCatch(
  {
    as.numeric(gsub("\\s", "", str))
  },
    error = function(cond) str,
    warning = function(cond) str,
    finally = { }
  )
}

fix_data <- function(data) {
  sapply(data, function(str) lapply(str, try_get_num))
}

setwd("/Users/lev.saskov/MyProgramms/Univercity/studyR/data")
data <- read.csv("lab1_e1.csv")
fixed_data <- fix_data(data)
