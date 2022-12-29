library(dplyr, warn.conflicts = FALSE)
library(stringr)
library(tidyr)
library(ggplot2)

setwd("/Users/lev.saskov/MyProgramms/Univercity/LessonsR/studyR/data")

# Подзадача 1.
# data2.csv, data1.txt Объедините data.frames по идентификаторам сортов.
# Исключите те сорта, для которых есть пропущенные значения.
countable_signs_unf <- read.csv("data2.csv")
countable_signs <- countable_signs_unf |> pivot_longer(!X, names_to = "Sample", values_to = "vals", values_drop_na = TRUE) |>
  pivot_wider(names_from = X, values_from = vals)

quality_signs_unf <- read.table("data1.txt", header = TRUE, skip = 1,)
quality_signs <- quality_signs_unf[, colnames(quality_signs_unf)[2:5]] |> drop_na()

res <- merge(countable_signs, quality_signs, by = "Sample")

# Подзадача 2.
# Для всех наблюдаемых величин из файла data1.txt (из первого дз),
# в которых содержится не более 80% пропущенных значений нарисовать гистограммы.
df <- read.table("data1.txt", header = TRUE, skip = 1,)
df <- quality_signs_unf[, colnames(quality_signs_unf)[2:5]]
# Условие про 80 процентов очень странное, там везде меньше 80 процентов
# Строим гистограмму для Height:
hist(df$Height, main = "Histogram of height", xlab = "Height")
# Строим гистограмму для Height:
hist(df$Protein, main = "Histogram of protein", xlab = "Protein")
# Строим гистограмму для Height:
hist(df$Oil, main = "Histogram of oil", xlab = "Oil")

# Подзадача 3.
# Построение heatmap для коэффициента Пирсона у количественных переменных
fixed <- drop_na(df)[2:4]
cormat <- cor(fixed)
heatmap(cormat)
