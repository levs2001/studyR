# RH_T.csv
# Файл содержит данные по температуре, относительной влажности и осадкам в Екатеринбурге за период с 2020 год. (T2M – средняя температура в течение дня).

# Используйте файл RH_T.csv Напишите функцию, которая находит 2 соседних дня с максимальным перепадом температуры.

# i >= 2 : condition
get_temp_diff <- function(i, temp) {
  abs(temp[i] - temp[i-1])
}

# returns (day, next_day, max_diff)
# day - the first day in pair for max diff
find_max_diff_days <- function(days, temperatures) {
  # Данные упорядочены по дате.
  # Идем циклом, начиная со 2го дня и смотрим на прошлый день, если разница больше записанной,
  # то меняем переменные указывающие на индекс и макс разницу

  # index of today, where today - yesterday is maximum
  max_diff_ind <- 2
  max_diff <- get_temp_diff(max_diff_ind, temperatures)
  for (i in 3 : length(temperatures)) {
    curr_diff <- get_temp_diff(i, temperatures)

    if (curr_diff > max_diff) {
      max_diff <- curr_diff
      max_diff_ind <- i
    }
  }
  c(days[max_diff_ind - 1], days[max_diff_ind], max_diff)
}

setwd("/Users/lev.saskov/MyProgramms/Univercity/LessonsR/studyR/data")
data <- read.csv("RH_T.csv")
days <- unlist(data["YYYYMMDD"], use.names = FALSE)
temperatures <- unlist(data["T2M"], use.names = FALSE)

answer <- find_max_diff_days(days, temperatures)
print(answer)