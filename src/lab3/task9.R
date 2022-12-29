library(dplyr, warn.conflicts = FALSE)
library(stringr)
library(tidyr)
library(readr)
library(ggplot2)

setwd("/Users/lev.saskov/MyProgramms/Univercity/LessonsR/studyR/data")

data <- read_csv("reforest.csv", na = c("-", "NA"))
fixed <- drop_na(data)
is_distr <- str_detect(fixed$Region, "федеральный округ")
distr_num <- 6
begin <- which(is_distr == "TRUE")[distr_num] + 1
end <- which(is_distr == "TRUE")[distr_num + 1] - 1
regions <- fixed[begin:end, ]
another <- pivot_longer(regions, !Region, names_to = "year", values_to = "value") |>
  mutate(year = as.numeric(year))

my_plot <- ggplot(another) +
  geom_line(mapping = aes(x = year, y = value, color = Region)) +
  geom_point(mapping = aes(x = year, y = value))
my_plot <- my_plot + geom_text(aes(x = year, y = value, label = value), vjust = 0, nudge_y = 0.05)
my_plot <- my_plot + xlab("Год") + ylab("Площадь(тысяч га)") + ggtitle(fixed$Region[[begin - 1]]) + theme(plot.title = element_text(hjust = 0.5))
print(my_plot)