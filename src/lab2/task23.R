# Используйте файл Payment_and_value_of_Care-Hospital.csv
# Напишите функцию, которая на вход принимает название города, округа или штата,
# а на выход выдает количество больниц в нем и процент больниц,
# в которых есть служба экстренной медицинской помощи.
# Если значение переданное на вход функции не является городом, округом или штатом, то должно функция должна выдавать соответствующее сообщение об ошибке.
# Обратите внимание, что функция должна принимать на вход только одно значение.


# Я не нашел в таблице информацию, которая говорила бы о наличии экстренной помощи в больнице.
get_place_hospitals_stat <- function(place, data) {
  # Проверка город ли это
  filtered <- data[data$City == place, "Facility.ID"]
  # Проверка округ ли это
  if(length(filtered) == 0) {
    filtered <- data[data$Country.Name == place, "Facility.ID"]
  }
  # Проверка штат ли это
  if(length(filtered) == 0) {
    filtered <- data[data$State == place, "Facility.ID"]
  }
  if(length(filtered) == 0) {
    message("Error: Incorrect place")
    return()
  }

  result <- list('hospitals_count' = NULL)
  result[['hospitals_count']] <- length(unique(filtered))

  result
}

setwd("/Users/lev.saskov/MyProgramms/Univercity/LessonsR/studyR/data")
data <- read.csv("Payment_and_Value_of_Care-Hospital.csv")
# Check for city
print(get_place_hospitals_stat("DOTHAN", data))
# Check for country
print(get_place_hospitals_stat("HOUSTON", data))
# Check for state
print(get_place_hospitals_stat("CA", data))
# Check for incorrect place
print(get_place_hospitals_stat("Incorrect place", data))
