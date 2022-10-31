get_full_table <- function(data) {
  res <- data[1]
  len <- length(data)
  for (i in 2:len) {
    res <- merge(x = res, y = data[i], by = "id", suffixes = c(i - 1, i))
  }
  res
}

get_list_of_temperatures <- function(full_table) {
  temperatures <- full_table[-1]
  days_count <- length(temperatures)
  people_count <- nrow(full_table)
  mean_temperature <- vector(length = people_count, mode = "double")
  for (j in 1:people_count) {
    sum_temp <- 0
    for (el in temperatures) {
      sum_temp <- sum_temp + el[j]
    }
    mean_temperature[j] <- sum_temp / days_count
  }

  data.frame(
    id = full_table[1],
    mean_temp = mean_temperature
  )
}
